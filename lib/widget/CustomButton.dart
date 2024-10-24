import 'package:flutter/material.dart';

import '../constes/constk.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.onTap,required this.textButton,this.color});

  @override
  String textButton;
  String? color;
   VoidCallback? onTap;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue[800],
            shape: const StadiumBorder(

            ),
            maximumSize: const Size(double.infinity, 46),
            minimumSize: const Size(double.infinity, 46),

          ),

        onPressed: onTap,
        child: Text(
          textButton,
          textAlign: TextAlign.center, // Center text
        ),
      ),
    );


  }
}
