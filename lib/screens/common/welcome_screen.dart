import 'package:flutter/material.dart';
import 'package:iclean_flutter/constant/gobal_variable.dart';

import '../../utils.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

// import 'package:myapp/utils.dart';

// import '../Register/CompleteProfile.dart';
// import '../SignIn/SignIn.dart';
// import 'homescreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 700;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 1.27;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 58),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: BaseConfig.BASE_COLOR,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/page-1/images/welcome-to.png'),
          ),
        ),
        child: SizedBox(
          height: 750,
          child: ListView(
            children: [
              SizedBox(
                height: ffem * 450,
              ),
              // Container(
              //   margin: const EdgeInsets.fromLTRB(58, 0, 51, 19),
              //   padding: const EdgeInsets.fromLTRB(64, 20, 80, 20),
              //   width: double.infinity,
              //   height: 64,
              //   decoration: BoxDecoration(
              //     color: const Color(0xffffffff),
              //     borderRadius: BorderRadius.circular(38),
              //   ),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              //         width: 24,
              //         height: 24,
              //         child: Image.asset(
              //           'assets/page-1/images/google.png',
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       Expanded(
              //         child: Text(
              //           'Continue with Google',
              //           style: SafeGoogleFont(
              //             'Satoshi',
              //             fontSize: 13,
              //             fontWeight: FontWeight.w700,
              //             height: 1.2575,
              //             color: BaseConfig.BASE_COLOR,
              //             decoration: TextDecoration.none,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(55, 0, 54, 20),
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                    color: BaseConfig.BASE_COLOR,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: SafeGoogleFont(
                        'Satoshi',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1.2575,
                        color: const Color(0xffffffff),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(54, 0, 55, 0),
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                      color: const Color(0xfffcfff9),
                      borderRadius: BorderRadius.circular(38),
                      border: Border.all(
                        color: BaseConfig.BASE_COLOR,
                        width: 3,
                      )),
                  child: Center(
                    child: Text(
                      'I Already Have an Account',
                      style: SafeGoogleFont(
                        'Satoshi',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1.2575,
                        color: BaseConfig.BASE_COLOR,
                        decoration: TextDecoration.none,
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
