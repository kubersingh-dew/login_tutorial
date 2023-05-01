import 'package:flutter/material.dart';

import '../../utils/NavigationManager.dart';
import '../../utils/Utils.dart';
import 'BottomContainer.dart';
import 'ButtonView.dart';
import 'EditTextView.dart';
import 'HeaderContainer.dart';


class LoginRegisterView extends StatefulWidget {
  const LoginRegisterView({super.key});

  @override
  LoginRegisterViewState createState() => LoginRegisterViewState();
}

class LoginRegisterViewState extends State implements OnPressEvent {

  final int registerEvent = 300;
  final int loginEvent = 301;
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final mobileController = TextEditingController();
  final eduController = TextEditingController();
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
          EditTextView(hintText: "Email", icon: Icons.email, controller: emailController,keyboardType: TextInputType.emailAddress,),
          EditTextView(hintText: "City", icon: Icons.home, controller: cityController),
          EditTextView(hintText: "Mobile Number", icon: Icons.phone, controller: mobileController, keyboardType: TextInputType.phone,),
          EditTextView(hintText: "College", icon: Icons.cast_for_education, controller: eduController),
          EditTextView(hintText: "Password", icon: Icons.key, controller: passController, isPassword: true,),
          ButtonView(text: "Register",event: this, eventCode: registerEvent,
            bgcolor: Colors.white, textColor: Colors.black,),
          BottomContainer(firstStr: "Already have an account",
            secondStr: "Login", event: this, eventCode: loginEvent,)
        ],
      ),
    );
  }

  checkAndValidateData() {
    String email, city, mobile, college, pass;
    email = emailController.text;
    city = cityController.text;
    mobile = mobileController.text;
    college = eduController.text;
    pass = passController.text;
    if(email.isEmpty || pass.isEmpty || city.isEmpty || mobile.isEmpty || college.isEmpty) {
      Utils.showToast("Field Required.");
      return;
    }
    if (!Utils.validateEmail(email)) {
      Utils.showToast("Invalid Email-ID");
      return;
    }
    if (pass.length < 8) {
      Utils.showToast("Password should have minimum 8 character");
      return;
    }
  }

  @override
  void onCLick(int eventCode) {
    if (eventCode == registerEvent) {
        checkAndValidateData();
    } else if (eventCode == loginEvent) {
        NavigationManager.navigateToBasePage(context);
    }
  }

}