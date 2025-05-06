
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/core/utils/app_style.dart';


class CustomBarcodeWidget extends StatelessWidget {
  const CustomBarcodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Icon(FontAwesomeIcons.barcode, size: 73),
       Container(
    width: 113,
    height: 58,
         decoration: ShapeDecoration(
           
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15),
             side: BorderSide(width: 1.50,color: Color(0xff34A853),),
           ),
         ),
          child: Center(
            child: Text(
             "PAID",
                            
             style: Styles.style24.copyWith(color: Color(0xff34A853)),
                              ),
          ),
       ),
       
        
     
     ],
                  );
  }
}
