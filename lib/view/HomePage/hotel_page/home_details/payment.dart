import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/widget/custom_appbar.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: Column(children: [CustomAppbar(title: Text("payment")  ,onPressed: (){

 GoRouter.of(context).pop();

}),
    
    
    ],)


    );
  }
}