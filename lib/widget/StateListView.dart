import 'package:donation/core/utils/stylr.dart';
import 'package:flutter/material.dart';


import '../models/urequest.dart';
import '../pages/detailspage.dart';
import 'news_shape.dart';

class StateListView extends StatelessWidget {
  final UserRequest name;
  final UserRequest title;
  final UserRequest age;
  final UserRequest gender;
  final UserRequest description;
  final UserRequest amount;
  final UserRequest email;
  final int index;

  final List<String> imgList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.webp',
    'assets/images/4.jpg',
    'assets/images/54476.jpg',
  ];

  StateListView({
    Key? key,
    required this.title,
    required this.name,
    required this.age,
    required this.gender,
    required this.description,
    required this.amount,
    required this.email,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                name: name,
                title: title,
                age: age,
                gender: gender,
                description: description,
                amount: amount,
                email: email,
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 150,
          child: Material(
            elevation: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    imgList[index % imgList.length],
                    height: 150.0,
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded( // Wrap in Expanded to prevent overflow
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          name.name,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 10.0,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          color: Colors.grey[400],
                          child: Text(
                            amount.amount,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


