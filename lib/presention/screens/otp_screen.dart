import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_app/core/constant/mu_strigs.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../bussiness_logic/cubit/phone_auth/phone_auth_cubit.dart';
import '../../core/constant/my_colors.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  final phoneNumber;
  late String otpCode;
//Done//=>1
  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          MyStrings.whatIsNumber,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: MyStrings.sentCode,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                height: 1.4,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '$phoneNumber',
                  style: TextStyle(
                    color: MyColors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

//Done//=>2
  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
    showDialog(
        barrierColor: Colors.white.withOpacity(0),
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  //Done//=>3
  Widget _buildPinCodeFields(BuildContext context) {
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
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          otpCode = submitedCode;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  //Done//=>4
  void _login(BuildContext context) {
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
  }

//Done//=>5

  Widget _buildVerifyButtom(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndicator(context);
          _login(context);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Vrify',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

//Done//=>6

  Widget _buildPhoneverificationBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          showProgressIndicator(context);
        }
        if (state is phoneOTPVerified) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(mapScreen);
        }
        if (state is ErrorOccurred) {
          // Navigator.pop(context);
          String errorMas = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(
          const  SnackBar(
              // content: Text(errorMas),
              content: Text("Please Enter The OTP Code Success"),

              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
          child: ListView(
            children: [
              _buildIntroTexts(),
              SizedBox(height: size.height * .09),
              _buildPinCodeFields(context),
              SizedBox(height: size.height * .05),
              _buildVerifyButtom(context),
              _buildPhoneverificationBloc(),
            ],
          ),
        ),
      ),
    );
  }
}
