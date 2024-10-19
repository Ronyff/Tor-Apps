import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tor_application/conts/app_color.dart';

class VioletButton extends StatelessWidget {
  final String title;
  final Function onAction;
  VioletButton(this.title,this.onAction);

  @override
  Widget build(BuildContext context) {
    RxBool _value = false.obs;
    return Obx(() => InkWell(
          onTap: () {
            _value.value = true;
            onAction();
          },
          child: Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColor.violetColor,
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            child: _value == false
                ? Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please wait",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                      Transform.scale(
                        scale: 0.4,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        )),
                    ],
                  ),
          ),
        ));
  }
}
