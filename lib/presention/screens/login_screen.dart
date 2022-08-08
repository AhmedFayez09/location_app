import 'package:flutter/material.dart';

import '../widgets/login_widgets/build_intro-text.dart';
import '../widgets/login_widgets/build_phone_text_formfield.dart';
import '../widgets/login_widgets/build_next_buttom.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _phoneFormKey,
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 88,
              horizontal: 32,
            ),
            child: ListView(
              children: [
                const BuildIntroText(),
                SizedBox(height: size.height*0.1,),
                BulidPhoneFormField(),
                 SizedBox(height: size.height*0.07,),
                BuildNextButtom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
