import 'package:flutter/material.dart';


import 'catugaryCard.dart';
import '../models/category_models.dart';
class catugarys_list_view extends StatelessWidget {
  const catugarys_list_view({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
         Padding(
           padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
           child: Row(
             children: [
               const Text(
                 'Emergency State',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                   // color: Colors.white,
                 ),
               ),
             ],
           ),
         ),
        SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const catugary_card();
              }),
        ),
      ],
    );
  }
}
