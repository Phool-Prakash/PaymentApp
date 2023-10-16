import 'package:app_online_payment/Splash&Reg&login/Reg&LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> loadData(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 2)); // Simulate a 2-second delay

  // Navigate to the destination screen (HomeScreen in this case)
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => const LogInAndSignInScreen()),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    loadData(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(218, 255, 170, 1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SvgPicture.asset('Assets/interest.svg'),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SvgPicture.asset('Assets/Line 1 (Stroke).svg'),
                )
              ],
            ),
            SvgPicture.asset('Assets/walt.svg'),
          ],
        ),
      ),
    );
  }
}
