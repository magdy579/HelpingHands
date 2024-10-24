import 'package:flutter/material.dart';

import '../models/urequest.dart';


class NewsStyle extends StatelessWidget {
  
    // final ArticleModel articleModel;


   NewsStyle({super.key,required this.name,required this.age,required this.gender,required this.description,required this.amount,required this.email});
  @override
  UserRequest name;
  UserRequest age;
  UserRequest gender;
  UserRequest description;
  UserRequest amount;
  UserRequest email;
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(
          height: 12.0,
        ),
         Text(
          name as String,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        ),
        const SizedBox(
          height: 8,
        ) ,
         Text(
           age as String,
           maxLines: 2,
          style: const TextStyle(
          color: Colors.black,
          fontSize: 10.0,
        ),
        ),
         Text(
           gender as String,
           maxLines: 2,
          style: const TextStyle(
          color: Colors.black,
          fontSize: 10.0,
        ),
        ),
         Text(
           description as String,
           maxLines: 2,
          style: const TextStyle(
          color: Colors.black,
          fontSize: 10.0,
        ),
        ),
         Text(
           amount as String,
           maxLines: 2,
          style: const TextStyle(
          color: Colors.black,
          fontSize: 10.0,
        ),
        ),
         Text(
           email as String,
           maxLines: 2,
          style: const TextStyle(
          color: Colors.black,
          fontSize: 10.0,
        ),
        ),
      ],
    );
  }
}
