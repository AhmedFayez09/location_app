import 'package:flutter/material.dart';
import 'package:location_app/core/constant/my_colors.dart';

class BulidPhoneFormField extends StatelessWidget {
  BulidPhoneFormField({Key? key}) : super(key: key);
  late String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.lightGrey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Text(
              // ignore: prefer_interpolation_to_compose_strings
              generateCountryFlag() + ' +20',
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.blue,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: TextFormField(
              autofocus: true,
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 2,
              ),
              decoration: const InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please enter your phone number';
                } else if (val.length < 11) {
                  return 'Too short for a phone number';
                } else
                  null;
              },
              onSaved: (val) {
                phoneNumber = val!;
              },
            ),
          ),
        ),
      ],
    );
  }

  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),(match) =>String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),);
    return flag;
  }
}
