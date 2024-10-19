import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tor_application/ui/widgets/violet_button.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w, top: 20.0.h),
          child: Column(children: [
            Expanded(child: Container(color: Colors.amber,),),
            SizedBox(
                height: 10.h,
              ),
            VioletButton("Agree", (){}),
            SizedBox(height: 20.h,),
          ],),
        ),
      ),
    );
  }
}