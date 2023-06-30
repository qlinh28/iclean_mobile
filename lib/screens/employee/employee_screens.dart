//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iclean_flutter/screens/employee/home_screen.dart';
import 'package:iclean_flutter/screens/user/my_bookings_screen.dart';
import 'package:iclean_flutter/screens/user/notification_screen.dart';
import 'package:iclean_flutter/screens/user/profile_screen.dart';

import '../../models/account.dart';

class EmployeeScreens extends StatefulWidget {
  const EmployeeScreens({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  State<EmployeeScreens> createState() => _EmployeeScreensState();
}

class _EmployeeScreensState extends State<EmployeeScreens> {
  String? mtoken = " ";
  int _selectedIndex = 0;

  late List<Widget> _screenOptions;

  @override
  void initState() {
    super.initState();
    //requestPermission();
    _screenOptions = <Widget>[
      const HomeScreen(),
      const MyBookingsScreen(),
      // const InboxScreen(),
      const NotificationScreen(),
      ProfileScreen(account: widget.account),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
          child: GNav(
        backgroundColor: Colors.deepPurple.shade300,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.deepPurple.shade400,
        gap: 8,
        padding: const EdgeInsets.all(10),
        tabMargin: const EdgeInsetsDirectional.all(8),
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
            textStyle: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          GButton(
            icon: Icons.calendar_today_outlined,
            text: 'Booking',
            textStyle: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          // GButton(
          //   icon: Icons.chat,
          //   text: 'Inbox',
          //   textStyle: TextStyle(
          //     fontFamily: 'Lato',
          //     color: Colors.white,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          GButton(
            icon: Icons.notifications_none_outlined,
            text: 'Notification',
            textStyle: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          GButton(
            icon: Icons.person_outline,
            text: 'Profile',
            textStyle: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
