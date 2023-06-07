import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/account.dart';
import 'package:iclean_flutter/screens/user/location_screen.dart';
import 'package:iclean_flutter/screens/user/payment_screen.dart';
import 'package:iclean_flutter/screens/user/update_profile_screen.dart';

import '../common/login_screen.dart';
import '../common/user_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Account account = Account(
      id: 1,
      username: 'user1',
      role: 'user',
      fullname: 'lisa',
      gender: 'female',
      dateOfBirth: DateTime.now(),
      phone: '019191919',
      email: 'email@gmail.com',
      profilePicture: 'assets/images/lisa_avatar.jpg',
      location: 'adasdasdsadasdsadsadsa');

  Future<void> _logout() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
    await UserPreferences.logout();
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
                const SizedBox(height: 20),
                Column(
                  children: const [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/lisa_avatar.jpg'),
                      radius: 50,
                    ),
<<<<<<< HEAD:lib/screens/user/profile_screen.dart
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UpdateProfileScreen(account: account)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                          ),
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.location_on_outlined),
                              SizedBox(width: 15),
                              Text(
                                "Location",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                        ),
                        const Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
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
                          ),
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                        ),
                        const Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                        ),
                        const Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                        ),
                        const Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
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
                              title: const Text(
                                "Confirm Log Out",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                ),
                              ),
                              content: const Text(
                                "Are you sure you want to log out?",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontFamily: 'Lato',
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
                                  child: const Text(
                                    "Log Out",
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                    ),
                                  ),
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
              )
            ],
=======
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
                const SizedBox(height: 20),
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
                      buildMenuItem(
                        icon: Icons.person_outline,
                        text: "Edit Profile",
                      ),
                      buildMenuItem(
                        icon: Icons.notifications_outlined,
                        text: "Notification",
                      ),
                      buildMenuItem(
                        icon: Icons.payment_outlined,
                        text: "Payment",
                      ),
                      buildMenuItem(
                        icon: Icons.language_outlined,
                        text: "Language",
                      ),
                      buildMenuItem(
                        icon: Icons.remove_red_eye_outlined,
                        text: "Dark Mode",
                      ),
                      buildMenuItem(
                        icon: Icons.policy_outlined,
                        text: "Privacy Policy",
                      ),
                      const SizedBox(height: 10),
                      buildMenuItem(
                        icon: Icons.logout,
                        text: "Log out",
                        textColor: Colors.red,
                        iconColor: Colors.red,
                        onPressed: () => showLogoutConfirmationDialog(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
>>>>>>> linh-sii:lib/screens/renter/profile_screen.dart
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required String text,
    Color textColor = Colors.black,
    Color iconColor = Colors.black,
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.grey.withOpacity(0.2);
              } else {
                return Colors.transparent;
              }
            },
          ),
          mouseCursor: MaterialStateProperty.all<MouseCursor>(
            SystemMouseCursors.click,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ),
                const SizedBox(width: 15),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Lato',
                    color: textColor,
                  ),
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.deepPurple.shade300),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.deepPurple.shade300,
                ),
              ),
              onPressed: _logout,
              child: const Text("Log Out"),
            ),
          ],
        );
      },
    );
  }
}
