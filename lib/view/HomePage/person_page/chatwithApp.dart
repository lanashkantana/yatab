import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:test/core/widget/custom_app_bar.dart';
import 'package:test/core/widget/custom_text_field.dart';
import 'package:test/generated/l10n.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String? sessionId;
  String? nextFact;
  bool isBotTyping = false;
void _sendMessage(String text) {
  if (text.trim().isEmpty) return;

  // التحقق من النص المدخل
  if (text.trim().toLowerCase() != 'start' && sessionId == null) {
    setState(() {
      messages.add({"sender": "bot", "text": "يرجى كتابة 'start' لبدء المحادثة."});
    });
    return;
  }

  setState(() {
    messages.add({"sender": "user", "text": text});
    isBotTyping = true;
  });

  _controller.clear();
  _getResponse(text.trim());
}

  Future<void> _getResponse(String text) async {
    if (sessionId == null) {
      final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/tourism/start'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        sessionId = data['session_id'];
        nextFact = data['next_fact'];
        setState(() {
          messages.add({
            "sender": "bot",
            "text": "${data['question']}\n(choose: ${data['options'].join(", ")},)"
          });
          isBotTyping = false;
        });
      } else {
        setState(() {
          messages.add({"sender": "bot", "text": "حدث خطأ في بدء الجلسة."});
          isBotTyping = false;
        });
      }
    } else {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/api/tourism/answer'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "session_id": sessionId,
          "fact_name": nextFact,
          "fact_value": text,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['is_final'] == true) {
          setState(() {
            messages.add({"sender": "bot", "text": data['result']});
            nextFact = null;
            isBotTyping = false;
          });
        } else {
          setState(() {
            messages.add({
              "sender": "bot",
              "text": "${data['question']}\n(choose: ${data['options'].join(", ")})"
            });
            nextFact = data['next_fact'];
            isBotTyping = false;
          });
        }
      } else {
        setState(() {
          messages.add({"sender": "bot", "text": "حدث خطأ أثناء إرسال الإجابة."});
          isBotTyping = false;
        });
      }
    }

    Future.delayed(Duration(milliseconds: 300), () {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  Future<void> _resetSession() async {
    if (sessionId != null) {
      await http.post(
        Uri.parse('http://10.0.2.2:5000/api/tourism/reset'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"session_id": sessionId}),
      );
    }

    setState(() {
      sessionId = null;
      nextFact = null;
      messages.clear();
      isBotTyping = false;
    });

    _getResponse(""); // Start new session
  }

  Widget _buildMessageBubble(Map<String, String> message, int index) {
    final isUser = message['sender'] == 'user';

    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 400),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: Align(
            alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
              decoration: BoxDecoration(
                color: isUser ? Colors.blueAccent : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                  bottomLeft: Radius.circular(isUser ? 14 : 0),
                  bottomRight: Radius.circular(isUser ? 0 : 14),
                ),
              ),
              child: Text(
                message['text']!,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black,
fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          "جاري الكتابة...",
          style: TextStyle(
            color: Colors.black54,
            fontStyle: FontStyle.italic,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: S.of(context).appBar_chat,
        onPressed: () => GoRouter.of(context).pop(),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh,size: 30,color: Colors.black,),
            onPressed: _resetSession,
          ),
        ],
      ),
   
      
      body: Column(
        children: [
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: messages.length + (isBotTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < messages.length) {
                    return _buildMessageBubble(messages[index], index);
                  } else {
                    return _buildTypingIndicator();
                  }
                },
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: CustomFormTextField(hintText: S.of(context).write_message, obscureText: false, controller: _controller, 
                      keyboardType:TextInputType.text,onFieldSubmitted: _sendMessage),
                      
                      
                    ),
                  ),
               5.horizontalSpace,
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.blueAccent,
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () => _sendMessage(_controller.text),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
   );
    
  }
}
