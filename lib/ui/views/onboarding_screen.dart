import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt _currentIndex = 0.obs;
    List<String> _lottie = [
      "assets/files/weelcome.json",
      "assets/files/help.json",
      "assets/files/plane.json",
    ];
    List<String> _title = ['welcome', 'help', 'plane'];
    List<String> _description = [
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                  flex: 2,
                  child: LottieBuilder.asset(
                    _lottie[_currentIndex.toInt()],
                  )),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  _currentIndex += 1;
                  print(_currentIndex);
                },
                child: Text('Click me'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
