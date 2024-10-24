import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constes/constk.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,this.onChanged ,this.hintText,this.obscureText =false,this.icon,this.validator,this.controller});
  @override
  String? hintText;
  bool obscureText ;
  Icon? icon  ;
  Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical:5 ,horizontal: 30),
      margin:EdgeInsets.symmetric(vertical:10) ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29) ,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        cursorColor: kPrimaryColor,
        obscureText:obscureText!,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: icon,
          ),

        ),
        validator: validator,
      ),
    );
  }
}