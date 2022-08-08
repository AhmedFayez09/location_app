import 'package:flutter/material.dart';
import 'package:location_app/core/constant/my_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class BuildPinCodeFields extends StatelessWidget {
  const BuildPinCodeFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        obscureText: false,
        cursorColor: Colors.black,
        autoFocus: true,
        keyboardType: TextInputType.number,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            borderWidth: 1,
            inactiveFillColor: Colors.white,
            activeColor: MyColors.blue,
            inactiveColor: MyColors.blue,
            activeFillColor: MyColors.lightBlue,
            selectedColor: MyColors.blue,
            selectedFillColor: Colors.white),
        animationDuration:const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (code) {
          //otpCode =code;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
