import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation/core/utils/stylr.dart';
import 'package:donation/pages/bottom_navbar.dart';
import 'package:donation/pages/detailspage.dart';
import 'package:donation/widget/catugray_list_view.dart';
import 'package:donation/pages/regessterpage.dart';
import 'package:donation/payment/payment_details.dart';
import 'package:donation/widget/news_shape.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constes/constk.dart';
import '../models/urequest.dart';
import '../widget/catugaryCard.dart';
import '../widget/StateListView.dart';
import 'AddPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/12cbd219-3ddf-4b22-ba9e-1d386432fd3b_1024.jpeg',
    'assets/images/4.jpg',
    'assets/images/54476.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    var email= ModalRoute.of(context)!.settings.arguments;
    CollectionReference users =
        FirebaseFirestore.instance.collection(kMessagesCollections);

    return StreamBuilder<QuerySnapshot>(
      stream: users.orderBy('createdat').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<UserRequest> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(UserRequest.fromjson(snapshot.data!.docs[i]));
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Campaigns',
                textAlign: TextAlign.center,
                style: style.style25,
              ),
              backgroundColor: Colors.white,
              elevation: 0.1,
              centerTitle: true,
            ),
            // backgroundColor: Colors.grey[200],
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(

                          horizontal: 14,
                        ),
                        labelText: 'Search',
                        suffixIcon: Icon(Icons.search),
                        hintText: 'Search for Campaign',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Let\'s Share Goodness...',
                          style: style.style24,
                        ),
                        Text(
                          'Good People Help Each Other',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: messageList.length,
                              itemBuilder: (context, index) {
                                return StateListView(
                                  title: messageList[index],
                                  name: messageList[index],
                                  age: messageList[index],
                                  gender: messageList[index],
                                  description: messageList[index],
                                  amount: messageList[index],
                                  email: messageList[index],
                                  index: index,
                                );
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      name: messageList[index],
                                      title: messageList[index],
                                      age: messageList[index],
                                      gender: messageList[index],
                                      description: messageList[index],
                                      amount: messageList[index],
                                      email: messageList[index],
                                    ),
                                  ),
                                );
                              },
                              child: Text(''),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(
                                    0), // Remove elevation
                                backgroundColor: MaterialStateProperty.all(Colors
                                        .white), // Set background color to transparent
                                overlayColor: MaterialStateProperty.all(Colors
                                    .transparent), // Set overlay color to transparent
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavbar(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPage.id);
              },
              child: Icon(Icons.add),
              elevation: 0,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
