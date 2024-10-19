import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tor_application/conts/app_color.dart';

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
                  flex: 3,
                  child: LottieBuilder.asset(
                    _lottie[_currentIndex.toInt()],
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.scaffoldColler,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 10,
                      spreadRadius: 1.0,
                    ), // BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 5,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          _title[_currentIndex.toInt()],
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20.sp),
                        ),
                      ),
                      Obx(
                        () => Text(
                          _description[_currentIndex.toInt()],
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => DotsIndicator(
                              dotsCount: _lottie.length,
                              position: _currentIndex.toInt(),
                              decorator: DotsDecorator(),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_currentIndex == 2) {
                                Get.toNamed('/signup-screen');
                              } else {
                                _currentIndex += 1;
                              }
                            },
                            child: Container(
                              height: 37.h,
                              width: 37.h,
                              decoration: BoxDecoration(
                                color: Color(0xFFE9EDF0),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 10,
                                    spreadRadius: 1.0,
                                  ), // BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 5,
                                    spreadRadius: 1.0,
                                  ), // BoxShadow
                                ],
                              ),
                              child: Icon(Icons.arrow_forward),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
