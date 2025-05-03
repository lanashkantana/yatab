// import 'package:flutter/material.dart';
// import 'package:test/view/HomePage/hotel_page/hotel_list_model.dart';

// class BookingPage extends StatefulWidget {
//   final HotelListData hotel;
//   const BookingPage({super.key, required this.hotel});

//   @override
//   State<BookingPage> createState() => _BookingPageState();
// }

// class _BookingPageState extends State<BookingPage> {
//   final nameController = TextEditingController();
//   int nights = 1;

//   @override
//   Widget build(BuildContext context) {
//     final total = nights * widget.hotel.perNight;

//     return Scaffold(
//       appBar: AppBar(title: const Text("إتمام الحجز")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Text("فندق: ${widget.hotel.titleTxt}", style: const TextStyle(fontSize: 20)),
//             const SizedBox(height: 20),
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                 labelText: "اسمك الكامل",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 const Text("عدد الليالي:"),
//                 const SizedBox(width: 12),
//                 DropdownButton<int>(
//                   value: nights,
//                   items: List.generate(10, (index) => index + 1)
//                       .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
//                       .toList(),
//                   onChanged: (value) {
//                     if (value != null) setState(() => nights = value);
//                   },
//                 )
//               ],
//             ),
//             const SizedBox(height: 20),
//             Text("الإجمالي: \$${total.toStringAsFixed(2)}", style: const TextStyle(fontSize: 18)),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 // هنا يمكنك تنفيذ منطق الحجز (API أو تأكيد)
//                 showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                     title: const Text("تم الحجز بنجاح"),
//                     content: Text("شكرًا ${nameController.text} لحجزك في ${widget.hotel.titleTxt}"),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("تم"),
//                       )
//                     ],
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
//               child: const Text("تأكيد الحجز"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
