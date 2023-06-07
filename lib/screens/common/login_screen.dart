// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iclean_flutter/constant/gobal_variable.dart';
import 'package:iclean_flutter/screens/common/user_preferences.dart';

import '../../constant/url_constants.dart';
import '../../models/account.dart';
import 'package:http/http.dart' as http;

import '../user/components/user_screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPassword = true;
  bool _rememberMe = false;

  setToken(String username, String password) async {
    await UserPreferences.setLoggedIn(true);
    await UserPreferences.setUsername(username);
    await UserPreferences.setPassword(password);
  }

  setAccount(Account account) async {
    await UserPreferences.setUserInfomation(account);
  }

  Future<void> _handleLogin(String username, String password) async {
    final response = await http.post(
      Uri.parse("${UrlConstant.LOGIN}/sign-in"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      final jsonMap = json.decode(utf8.decode(response.bodyBytes));
      final data = jsonMap['data'];
      await setToken(username, password);
      final dataAccount = data['user'];
      final account = Account.fromJson(dataAccount);
      await setAccount(account);
      if (account.role == 'user') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserScreens(account: account)),
        );
      } else if (account.role == 'employee') {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => WorkerScreens(account: account)),
        // );
      } else if (account.role == 'admin') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Error',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Oops! Something went wrong.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    text: 'You do not have accept for this app. ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: 'Please check your credentials and try again.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
            elevation: 8,
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Error',
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Oops! Something went wrong.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: const TextSpan(
                  text: 'Invalid username or password. ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text: 'Please check your credentials and try again.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          elevation: 8,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Text(
                'Hello there',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Please enter your username and password to sign in.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(height: 48),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                      ),
                      validator: (value) {
                        if (value?.isNotEmpty == true && value!.length > 2) {
                          return null;
                        } else if (value?.isNotEmpty == true &&
                            value!.length < 3) {
                          return 'No way your name is that short';
                        } else {
                          return 'Please give us your name already';
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),
                        suffixIcon: IconButton(
                          icon: _isPassword
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPassword = !_isPassword;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                      ),
                      validator: (value) {
                        if (value?.isNotEmpty == true && value!.isNotEmpty) {
                          return null;
                        } else if (value?.isNotEmpty == true) {
                          return 'Password is too short';
                        } else {
                          return 'Please give password already';
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ForgotPassword()),
                    // );
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: BaseConfig.BASE_COLOR,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ForgotPassword()),
                    // );
                  },
                  child: const Text(
                    'or continue with',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffd9d9d9)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/page-1/images/google-eZe.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == false) {
                      return;
                    }
                    _handleLogin(
                      _usernameController.text.toString(),
                      _passwordController.text.toString(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BaseConfig.BASE_COLOR,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
