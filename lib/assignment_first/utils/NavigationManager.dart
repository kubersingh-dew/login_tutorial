import 'package:flutter/material.dart';
import 'package:login_tutorial/assignment_three/DashBoardScreen.dart';
import '../../assignment_second/PayScreen.dart';
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

  static void navigateToAssignSecond(BuildContext cx) {
    Navigator.push(
      cx,
      MaterialPageRoute(builder: (context) => const PayScreen()),
    );
  }

  static void navigateToAssignThree(BuildContext cx) {
    Navigator.push(
      cx,
      MaterialPageRoute(builder: (context) => const DashBoardScreen()),
    );
  }

}
