import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tor_application/business_logic/auth.dart';
import 'package:tor_application/conts/app_color.dart';

import 'package:tor_application/ui/styles/styles.dart';
import 'package:tor_application/ui/views/auth/sign_in.dart';
import 'package:tor_application/ui/widgets/violet_button.dart';

class SignUp extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w, top: 80.0.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create\nYour account",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 36.sp,
                      color: AppColor.violetColor),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Create Your account and start your journey...",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 80.h,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppStyle().textFieldDecoration("Enter email"),
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: AppStyle().textFieldDecoration("Enter password"),
                ),
                SizedBox(
                  height: 40.h,
                ),
                VioletButton(
                  "Create Account",
                  () => Auth().registration(
                      _emailController.text, _passwordController.text, context),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "--OR--.",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/google_icon.webp",
                          width: 30.w,
                          height: 30.h,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/facebook_icon.png",
                          width: 20.w,
                          height: 20.h,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                RichText(
                  text: TextSpan(
                    text: "Already an user?  ",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: "Log In",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300,
                              color: AppColor.violetColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => SignIn()));
                            })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
