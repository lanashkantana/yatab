import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  static Future<File?> chooseImageSource(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    
    // Show dialog to choose image source
    final option = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose Image Source"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.camera),
              child: Text("Camera"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              child: Text("Gallery"),
            ),
          ],
        );
      },
    );

    if (option != null) {
      final pickedFile = await picker.pickImage(source: option);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        // Show validation error using AwesomeDialog
        AwesomeDialog(
          
          context: context,
          dialogType: DialogType.error,
          title: 'Validation Error',
          desc: 'No image was selected. Please try again.',
          btnOkOnPress: () {},
            transitionAnimationDuration: Duration(milliseconds: 500),
      dialogBorderRadius: BorderRadius.circular(40),
       dialogBackgroundColor: Colors.white
        ).show();
      }
    }
    return null; // In case of cancellation
  }
}