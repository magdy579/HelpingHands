import 'package:flutter/material.dart';
import '../models/category_models.dart';
import '../pages/detailspage.dart';

class catugary_card extends StatelessWidget {
// final category_Models category;

  const catugary_card({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {

      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blueAccent,
            // image: const DecorationImage(
            //   fit:  BoxFit.fill,
            //   image: AssetImage('assets/images/ppe_nursecpa_0.jpg',),
            // ),
          ),


        ),

      ),
    );
  }
}
