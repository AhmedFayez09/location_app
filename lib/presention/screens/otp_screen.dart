import 'package:flutter/material.dart';
import 'package:location_app/presention/widgets/otp_widgets/build_vrify_button.dart';
import '../widgets/otp_widgets/build_intro_text.dart';
import '../widgets/otp_widgets/build_pincode_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
          child: Column(
            children: [
              BuildIntroTextOtp(),
              SizedBox(height: size.height * .09),
              BuildPinCodeFields(),

              SizedBox(height: size.height*.05),
              BulidVrifyButtom()
            ],
          ),
        ),
      ),
    );
  }
}
