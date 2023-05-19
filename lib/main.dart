import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/common/login_screen.dart';
import 'package:iclean_flutter/screens/renter/components/user_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Hello',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return UserScreens();
  }
}

