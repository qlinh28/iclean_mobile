import 'package:flutter/material.dart';

import '../common/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _logout() async {
    //final storage = FlutterSecureStorage();
    //await storage.delete(key: 'accessToken');
    //await storage.delete(key: 'account');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                child: Column(
                  children: const [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/lisa_avatar.jpg'),
                      radius: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lisa",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             UpdateProfileScreen(account: widget.account)));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Row(
                                children: const [
                                  Icon(Icons.person_outline),
                                  SizedBox(width: 15),
                                  Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              )),
                              const Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Row(
                                children: const [
                                  Icon(Icons.notifications_outlined),
                                  SizedBox(width: 15),
                                  Text(
                                    "Notification",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              )),
                              const Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Row(
                                children: const[
                                  Icon(Icons.payment_outlined),
                                  SizedBox(width: 15),
                                  Text(
                                    "Payment",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              )),
                              const Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Row(
                                children: const [
                                  Icon(Icons.language_outlined),
                                  SizedBox(width: 15),
                                  Text(
                                    "Language",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              )),
                              const Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Row(
                                children: const [
                                  Icon(Icons.remove_red_eye_outlined),
                                  SizedBox(width: 15),
                                  Text(
                                    "Dark Mode",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              )),
                              const Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Row(
                                children: const [
                                  Icon(Icons.policy_outlined),
                                  SizedBox(width: 15),
                                  Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              )),
                              const Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors.red.withOpacity(0.2);
                                } else {
                                  return Colors.transparent;
                                }
                              },
                            ),
                            mouseCursor: MaterialStateProperty.all<MouseCursor>(
                                SystemMouseCursors.click),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Confirm Log Out"),
                                  content:
                                      const Text("Are you sure you want to log out?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: Colors.deepPurple.shade300),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.deepPurple.shade300),
                                      ),
                                      onPressed: _logout,
                                      child: const Text("Log Out"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Log out",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
