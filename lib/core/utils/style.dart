
import 'package:flutter/material.dart';
import 'package:test/constants.dart';

abstract class Styles {
  static const textstyle18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const textstyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textstyle30 = TextStyle(
      fontSize: 30,
      fontFamily: Constants.kGtSectraFine,
      fontWeight: FontWeight.normal);
  static const textstyle14 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
  static const textstyle16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}
// اضع ال font weaight بناءا على ال حجم التكرر اكثر 