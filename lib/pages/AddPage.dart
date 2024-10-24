import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation/widget/CustomButton.dart';
// import 'package:donation/widget/cTextFormField.dart';
import 'package:donation/widget/customaddform.dart';
import 'package:flutter/material.dart';

import '../constes/constk.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});
  static String id = 'AddPage';
  // CollectionReference usersrequest =
  // FirebaseFirestore.instance.collection(KMessagesCollections);
  @override
  State<AddPage> createState() => _AddPageState();
}

bool isLoading = false;

class _AddPageState extends State<AddPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0.1,
        centerTitle: true,
        title: const Text(
          'Add A Status',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CustomAddForm(
               ),
          ),
  ]
      ),
    );
  }
}
