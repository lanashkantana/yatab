
import 'package:flutter/material.dart';

class CardItemInfo extends StatelessWidget {
  const CardItemInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
    
      width: 305,
      decoration: ShapeDecoration(
        color: Colors.white,
    
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(backgroundColor: Colors.red, radius: 10),
              Positioned(
                right: -12,
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 10,
                ),
              ),
            ],
          ),
    
          SizedBox(width: 30),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Credit Card\n",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
    
                TextSpan(
                  text: "MasterCard **78",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}

