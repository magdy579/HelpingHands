import 'package:donation/pages/login.dart';
import 'package:flutter/material.dart';

import '../../constes/constk.dart';
import '../../pages/regessterpage.dart';
import '../../widget/CustomButton.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return  LoginPage();
                  },
                ),
              );
            },
            textButton:
            "Log in".toUpperCase(),
          ),

          CustomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return  RegisterPage();
                  },
                ),
              );
            },
      textButton:
      "Regster".toUpperCase(),
            ),


        ],
      ),
    );
  }
}
