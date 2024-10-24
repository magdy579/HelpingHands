import 'package:donation/pages/HomePage.dart';
import 'package:donation/pages/ProfilePage.dart';
import 'package:donation/payment/payment_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'test.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var email= ModalRoute.of(context)!.settings.arguments;
    return BottomAppBar(
      notchMargin: 5.0,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 0;
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home,
                    color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add similar GestureDetector widgets for other icons
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 3;
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return chatBot();
                }));
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FontAwesomeIcons.handsHelping,
                    color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                    // Change color based on the selected index
                  ),
                  Text(
                    "Helper",
                    style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 3;
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return PaymentPage();
                }));
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.payment,
                    color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    "payment",
                    style: TextStyle(
                      color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 4;
                Navigator.pushNamed(context,ProfilePage.id,arguments: email);
              });
            },
            child: Padding(
              
              padding: const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.profile_circled,
                    color: _selectedIndex == 4 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    "profile",
                    style: TextStyle(
                      color: _selectedIndex == 4 ? Colors.blue : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add similar GestureDetector widgets for other icons
        ],
      ),
    );
  }
}
