import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tor_application/ui/views/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 2),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OnboardingScreen(),
              ),
            ));
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logos/logo1.png",
              height: 279.h,
              width: 279.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Travel Agency center",
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      )),
    );
  }
}
