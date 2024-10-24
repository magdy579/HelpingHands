import 'package:donation/constes/constk.dart';
import 'package:donation/models/urequest.dart';
import 'package:donation/pages/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'CustomButton.dart';
import 'customTextField.dart';

class CustomAddForm extends StatefulWidget {
  const CustomAddForm({Key? key}) : super(key: key);

  @override
  State<CustomAddForm> createState() => _CustomAddFormState();
}

class _CustomAddFormState extends State<CustomAddForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  CollectionReference users =
  FirebaseFirestore.instance.collection(kMessagesCollections);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: titleController,
            hintText: 'Title',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: nameController,
            hintText: 'Name',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Name';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: ageController,
            hintText: 'Age',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your age';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: genderController,
            hintText: 'Gender',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Gender';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: description,
            hintText: 'Description',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a Description';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: amount,
            hintText: 'Amount of Money',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter the Amount of Money';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: emailController,
            hintText: 'Email',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Email';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
            child: CustomButton(
              textButton: 'Submit',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  await users.add({
                    'title': titleController.text, // Add title to Firestore
                    'name': nameController.text,
                    'age': ageController.text,
                    'gender': genderController.text,
                    'description': description.text,
                    'amount': amount.text,
                    'email': emailController.text,
                    'createdat': DateTime.now(),
                  }).then((value) => snackBar(context, 'Success'));
                  nameController.clear();
                  ageController.clear();
                  genderController.clear();
                  description.clear();
                  amount.clear();
                  emailController.clear();
                  titleController.clear(); // Clear the title field after submission
                } else {
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


