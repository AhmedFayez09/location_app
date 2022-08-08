import 'package:flutter/material.dart';

import 'package:location_app/core/constant/mu_strigs.dart';
import 'package:location_app/core/constant/my_colors.dart';

class BuildIntroTextOtp extends StatelessWidget {
  BuildIntroTextOtp({Key? key}) : super(key: key);

   final phoneNumber= '';
  @override
  Widget build(BuildContext context) {
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
}
