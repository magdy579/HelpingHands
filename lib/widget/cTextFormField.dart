import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,this.onChanged ,this.hintText,this.obscureText =false});

  @override
  String? hintText;  
  bool obscureText ;
  Function(String)? onChanged;      
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(

        decoration:  InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(fontSize: 15),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(
              color:Colors.white,
            ),
          ) ,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color:Colors.white,
            ),
          ),
        ),

      ),
    );
  }
}
