import 'package:flutter/material.dart';
import 'package:location_app/core/constant/mu_strigs.dart';
import 'package:location_app/presention/screens/otp_screen.dart';
import 'presention/screens/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case otpScreen:
        return MaterialPageRoute(
          builder: (_) => OtpScreen(),
        );
    }
  }
}
