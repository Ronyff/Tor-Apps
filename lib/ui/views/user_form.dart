import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tor_application/business_logic/form.dart';
import 'package:tor_application/conts/app_color.dart';
import 'package:tor_application/ui/styles/styles.dart';
import 'package:tor_application/ui/widgets/violet_button.dart';

class UserForm extends StatefulWidget {
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _dobController = TextEditingController();

  final DateTime selectedDate = DateTime.now();

  String? dob;

  String gender = 'Male';

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null) {
      _dobController.text =
          "${selected.day} - ${selected.month} - ${selected.year}";
      dob = _dobController.text; // Set dob here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w, top: 20.0.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tell Us More About You",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32.sp,
                      color: AppColor.violetColor),
                ),
                SizedBox(height: 12.h),
                Text(
                  "We will not share your information outside this application.",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 30.h),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: AppStyle().textFieldDecoration("name"),
                ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: AppStyle().textFieldDecoration("number"),
                ),
                TextFormField(
                  controller: _addressController,
                  keyboardType: TextInputType.text,
                  decoration: AppStyle().textFieldDecoration("address"),
                ),
                TextFormField(
                  controller: _dobController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'date of birth',
                    hintStyle: TextStyle(fontSize: 15.sp),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: Icon(Icons.calendar_month_outlined),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: ['Male', 'Female'],
                  onToggle: (index) {
                    gender = index == 0 ? "Male" : "Female";
                    print('switched to: $index');
                  },
                ),
                SizedBox(height: 20.h),
                VioletButton(
                  "submit",
                  () {
                    if (dob != null) {
                      UsersInfo().sendFormDataToDB(
                        _nameController.text,
                        _phoneController.text, // Corrected this line
                        _addressController.text,
                        dob!, // Now safe to use
                        gender,
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please select a date of birth");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
