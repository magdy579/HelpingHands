
import 'package:donation/core/utils/stylr.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
   TotalPrice({super.key, required this.title, required this.value});

   var title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: style.style24,
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: style.style24,
        )
      ],
    );
  }
}
