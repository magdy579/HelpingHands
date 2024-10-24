import 'package:donation/pages/login.dart';
import 'package:donation/pages/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constes/constk.dart';

import '../widget/CustomButton.dart';
import '../widget/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = "registerPage";
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  String? email;
  String? password;
  bool isLoading=false;
  GlobalKey<FormState> formKey = GlobalKey();
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 100,
                ),

                Center(
                  child: Text(
                    'Helping Hands',
                    style: TextStyle(
                      fontSize: 32,

                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Text(
                      'Register ',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'pacifico',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),

                CustomTextField(
                  icon: const Icon(Icons.person,),
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),

                CustomTextField(
                  icon: const Icon(Icons.lock,),
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading =true;
                          setState(() {});
                          try {
                            await Regesteration();
                            snackBar(context, 'Email is Create') ;
                          }on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              snackBar(context,'The password provided is too weak.');
                            }
                            else if (e.code == 'email-already-in-use') {
                              snackBar(context, 'The account already exists for that email.') ;
                            }
                          }
                          isLoading =false;
                          setState(() {});
                        }
                      },
                      textButton: 'Register'),
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account  ',

                      ),
                      GestureDetector(
                        onTap: () {
                           // Navigator.pushNamed(context, 'LoginPage');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return  LoginPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> Regesteration() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email!, password: password!);
  }


}
