import 'package:flutter/material.dart';
import 'package:login_tutorial/login/views/screens/LoginBaseView.dart';
import 'package:login_tutorial/login/views/screens/LoginEmailView.dart';
import 'package:login_tutorial/login/views/screens/LoginRegisterView.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key , required this.screenType});
  final int screenType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgimg.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container( //This is our new Container
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.black.withOpacity(0.95),
                      Colors.black.withOpacity(0.3),
                    ],
                  )
              ),
              child: getScreen(screenType),
            )
        )
    );
  }

  Widget getScreen(int screenType) {
     if (screenType == 1) {
       return const LoginBaseView();
     } else if (screenType == 2) {
       return const LoginEmailView();
     } else {
       return const LoginRegisterView();
     }
  }
}
