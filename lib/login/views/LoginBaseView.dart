import 'package:flutter/material.dart';
import 'package:login_tutorial/login/views/BottomContainer.dart';
import 'package:login_tutorial/login/views/ButtonView.dart';
import 'package:login_tutorial/utils/Extensions.dart';
import 'package:login_tutorial/utils/NavigationManager.dart';
import 'package:login_tutorial/utils/Utils.dart';
import 'HeaderContainer.dart';

class LoginBaseView extends StatefulWidget {
  const LoginBaseView({super.key});

  @override
  LoginBaseViewState createState() => LoginBaseViewState();
}

class LoginBaseViewState extends State implements OnPressEvent{

  final int googleEvent = 100;
  final int facebookEvent = 101;
  final int loginEvent = 102;
  final int registerEvent = 103;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const HeaderContainer(),
          ButtonView(text: "Google",event: this, eventCode: googleEvent,
            imageAsset: "assets/icons/gicon.png",
            bgcolor: Colors.white, textColor: Colors.black,),
          ButtonView(text: "Facebook",event: this, eventCode: facebookEvent,
            imageAsset: "assets/icons/ficon.png",
              bgcolor: "#3b5998".toColor(), imageColor: Colors.white,),
          ButtonView(text: "Login",event: this, eventCode: loginEvent,),
          BottomContainer(firstStr: "Don't have an account",
              secondStr: "Create Account",  event: this, eventCode: registerEvent)
        ],
      ),
    );
  }

  @override
  void onCLick(int eventCode) {
    if (eventCode == loginEvent) {
        NavigationManager.navigateToLoginPage(context);
    } else if (eventCode == registerEvent) {
        NavigationManager.navigateToRegistrationPage(context);
    } else if (eventCode == googleEvent) {

    }
  }


}