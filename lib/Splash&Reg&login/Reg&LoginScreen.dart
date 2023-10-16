import 'package:app_online_payment/SignIn&SignupPage/SignInScreen/PhoneSigninScreen.dart';
import 'package:app_online_payment/SignIn&SignupPage/SignUpScreen/PhoneRegisterScreen.dart';
import 'package:flutter/material.dart';

class LogInAndSignInScreen extends StatefulWidget {
  const LogInAndSignInScreen({super.key});

  @override
  State<LogInAndSignInScreen> createState() => _LogInAndSignInScreenState();
}

class _LogInAndSignInScreenState extends State<LogInAndSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(218, 255, 170, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create a new account',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PhoneSignUp()));
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                          letterSpacing: .5,
                          fontSize: 15,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PhoneSignIn()));
                    },
                    child: const Text(
                      'SignIn',
                      style: TextStyle(
                          letterSpacing: .5,
                          fontSize: 15,
                          decoration: TextDecoration.underline),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
