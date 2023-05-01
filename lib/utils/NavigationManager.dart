import 'package:flutter/material.dart';
import '../login/LoginScreen.dart';

class NavigationManager {

  static void navigateToBasePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen(screenType: 1)),
    );
  }

  static void navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen(screenType: 2)),
    );
  }

  static void navigateToRegistrationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen(screenType: 3)),
    );
  }

}
