import 'package:flutter/material.dart';
import 'package:login_tutorial/login/views/widgets/EditTextView.dart';
import 'package:login_tutorial/utils/Utils.dart';
import '../../../utils/NavigationManager.dart';
import '../widgets/BottomContainer.dart';
import '../widgets/ButtonView.dart';
import '../widgets/HeaderContainer.dart';

class LoginEmailView extends StatefulWidget {
  const LoginEmailView({super.key});

  @override
  LoginEmailViewState createState() => LoginEmailViewState();
}

class LoginEmailViewState extends State implements OnPressEvent{

  final int loginEvent = 200;
  final int registerEvent = 201;
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const HeaderContainer(),
          EditTextView(hintText: "Email", icon: Icons.email, keyboardType: TextInputType.emailAddress, controller: emailController),
          EditTextView(hintText: "Password", icon: Icons.key, controller: passController,isPassword: true,),
          ButtonView(text: "Login",event: this, eventCode: loginEvent,
            bgcolor: Colors.white, textColor: Colors.black,),
          BottomContainer(firstStr: "Don't have an account",
              secondStr: "Create Account", event: this, eventCode: registerEvent,)
        ],
      ),
    );
  }

  checkAndValidateData() {
    String email,pass;
    email = emailController.text;
    pass = passController.text;
    if(email.isEmpty || pass.isEmpty) {
      Utils.showToast("Field Required.");
      return;
    }
    if (!Utils.validateEmail(email)) {
      Utils.showToast("Invalid Email-ID");
      return;
    }
  }

  @override
  void onCLick(int eventCode) {
    if (eventCode == loginEvent) {
      checkAndValidateData();
    } else if (eventCode == registerEvent) {
      NavigationManager.navigateToRegistrationPage(context);
    }
  }

}