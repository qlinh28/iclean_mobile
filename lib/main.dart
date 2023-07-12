import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/account.dart';
import 'package:iclean_flutter/screens/common/user_preferences.dart';

import 'constant/size_config.dart';
import 'screens/common/welcome_screen.dart';
import 'screens/user/components/user_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final app = await MyApp.launch();
  runApp(app);
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final Account? account;

  const MyApp({Key? key, required this.isLoggedIn, this.account})
      : super(key: key);

  static Future<MyApp> launch() async {
    await UserPreferences.init();

    final isLoggedIn = UserPreferences.isLoggedIn();
    final account =
        isLoggedIn ? await UserPreferences.getUserInfomation() : null;
    return MyApp(isLoggedIn: isLoggedIn, account: account);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? UserScreens(account: account!) : const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const WelcomeScreen();
  }
}
