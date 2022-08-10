
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_app/bussiness_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:location_app/core/constant/mu_strigs.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: BlocProvider<PhoneAuthCubit>(
                  create: (context) => phoneAuthCubit,
                  child: ElevatedButton(
                        onPressed: ()async {
                       await phoneAuthCubit.logOut();
                       Navigator.of(context).pushReplacementNamed(loginScreen);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(110, 50),
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'LogOut',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}