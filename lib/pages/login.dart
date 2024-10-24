
import 'package:donation/pages/HomePage.dart';
import 'package:donation/pages/ProfilePage.dart';
import 'package:donation/pages/regessterpage.dart';
import 'package:donation/pages/snackbar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constes/constk.dart';
// import '../helper/snackBar.dart';
import '../widget/CustomButton.dart';
import '../widget/customTextField.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'LoginPage';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  var email, password;

  @override
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
                const Row(
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 24,
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
                  obscureText: true,
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
                          isLoading = true;
                          setState(() {});
                          try {
                            await loginUser();
                            Navigator.pushNamed(context,HomePage.id,arguments: email);
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'user-not-found') {
                              snackBar(context, 'No user found for that email.');
                            } else if (ex.code == 'wrong-password') {
                              snackBar(context, 'Wrong password provided for that user.');
                            }
                          } catch (ex) {
                            print(ex);
                            snackBar(context, 'there was an error');
                          }
                          isLoading = false;
                          setState(() {});
                        }
                      },
                      textButton: 'Log In',
                  ),
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'don\'t have an account  ',
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: const Text(
                          'Register',
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

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
