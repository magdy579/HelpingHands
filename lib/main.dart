import 'package:donation/Welcome/welcome_screen.dart';
import 'package:donation/pages/AddPage.dart';
import 'package:donation/pages/HomePage.dart';
import 'package:donation/pages/bottom_navbar.dart';
import 'package:donation/pages/detailspage.dart';
import 'package:donation/pages/login.dart';
import 'package:donation/pages/regessterpage.dart';

import 'package:donation/payment/payment_details.dart';
import 'package:donation/widget/edit_profile_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'constes/constk.dart';
import 'firebase_options.dart';
import 'pages/ProfilePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
final apikey='AIzaSyDUwGqyZ2vkuKsDeduKJ2zdUWjlALfDVTc';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,

          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
        //     elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //   elevation: 0,
        //     foregroundColor: Colors.white,
        //     backgroundColor: kPrimaryColor,
        //     shape: const StadiumBorder(),
        //     maximumSize: const Size(double.infinity, 46),
        //     minimumSize: const Size(double.infinity, 46),
        //   ),
        // ),
      ),

      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      // initialRoute: BottomNavbar(),
      routes: {
        LoginPage.id :(context) => LoginPage(),
        RegisterPage.id :(context) => RegisterPage(),
        HomePage.id : (context)=> HomePage(),
        PaymentPage.id : (context)=> PaymentPage(),
        ProfilePage.id : (context)=> ProfilePage(),
        edit_profile_page.id :(context) => edit_profile_page(),
        AddPage.id :(covariantntext) => AddPage(),


      },
    );
  }
}


