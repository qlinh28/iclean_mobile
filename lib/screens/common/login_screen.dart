import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/common/signup_screen.dart';
import 'package:iclean_flutter/screens/employee/employee_screens.dart';
import 'package:iclean_flutter/screens/user/components/user_screens.dart';

import 'component/my_textfield.dart';
import 'component/square_tile.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text editing
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // setToken(String token) async {
  //   final storage = new FlutterSecureStorage();
  //   await storage.write(key: 'accessToken', value: token);
  // }

  // setAccount(Account account) async {
  //   final jsonMap = account.toJson();
  //   final jsonString = jsonEncode(jsonMap);
  //   final storage = new FlutterSecureStorage();
  //   await storage.write(key: 'account', value: jsonString);
  // }

  // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  // Future<void> _loginWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //   if (googleUser != null) {
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     final UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     final User? user = userCredential.user;
  //     String token = await user!.getIdToken();
  //     final response = await http.post(
  //       Uri.parse('$BASE_URL/login/withIdToken?id_token="$token"'),
  //       headers: {'Content-Type': 'application/json'},
  //     );
  //     if (response.statusCode == 202) {
  //       final jsonMap = json.decode(utf8.decode(response.bodyBytes));
  //       final data = jsonMap['data'];
  //       await setToken(token);
  //       final dataAccount = data['accountDTO'];
  //       final account = Account.fromJson(dataAccount);
  //       await setAccount(account);
  //       if (account.role == 'renter') {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => UserScreens(account: account)),
  //         );
  //       } else if (account.role == 'employee') {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => WorkerScreens(account: account)),
  //         );
  //       }
  //     } else {
  //       // Display an error message if the login is unsuccessful
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text('Error'),
  //           content: Text('Invalid account'),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: Text('OK'),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   }
  // }

  // //sign user
  // Future<void> _handleLogin(String username, String password) async {
  //   final response = await http.post(
  //     Uri.parse('$BASE_URL/login'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode({'username': username, 'password': password}),
  //   );
  //   if (response.statusCode == 202) {
  //     final jsonMap = json.decode(utf8.decode(response.bodyBytes));
  //     final data = jsonMap['data'];
  //     final token = data['accessToken'];
  //     await setToken(token);
  //     final dataAccount = data['accountDTO'];
  //     final account = Account.fromJson(dataAccount);
  //     await setAccount(account);
  //     if (account.role == 'renter') {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => UserScreens(account: account)),
  //       );
  //     } else if (account.role == 'employee') {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => WorkerScreens(account: account)),
  //       );
  //     }
  //   } else {
  //     // Display an error message if the login is unsuccessful
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text('Invalid username or password'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                //logo
                Image.asset(
                  'assets/images/iClean.png',
                  height: 250,
                ),

                const SizedBox(height: 10),

                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontFamily: 'Lato',
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20),

                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //username textfield
                        MyTextField(
                            controller: _usernameController,
                            labelText: 'Username',
                            hintText: 'Username',
                            text: 'Username',
                            obscureText: false),

                        const SizedBox(height: 10),

                        //password texfield
                        MyTextField(
                            controller: _passwordController,
                            labelText: 'Password',
                            hintText: 'Password',
                            text: 'Password',
                            obscureText: true),

                        const SizedBox(height: 10),

                        //Forgot password
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        // MyButton(
                        //   text: "Sign in",
                        //   onTap: _submit,
                        // ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 6,
                            backgroundColor: Colors.deepPurple.shade300,
                            padding:
                                const EdgeInsets.fromLTRB(130, 20, 130, 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   _handleLogin(
                            //     _usernameController.text,
                            //     _passwordController.text,
                            //   );
                            // }
                            if (_usernameController.text.compareTo('user') ==
                                    0 &&
                                _passwordController.text.compareTo('test') ==
                                    0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserScreens()),
                              );
                            } else if (_usernameController.text
                                        .compareTo('employee') ==
                                    0 &&
                                _passwordController.text.compareTo('test') ==
                                    0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EmployeeScreens()),
                              );
                            } else {
                              // Display an error message if the login is unsuccessful
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(
                                      'Invalid username or password'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    )),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.grey[700],
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  //onPressed: _loginWithGoogle,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SquareTile(imagePath: "assets/images/google.png"),
                      Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: 'Lato',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Lato',
                      ),
                    ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
