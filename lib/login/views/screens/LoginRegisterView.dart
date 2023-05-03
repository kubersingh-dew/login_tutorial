import 'package:flutter/material.dart';
import 'package:login_tutorial/login/views/widgets/DateTextView.dart';
import 'package:login_tutorial/login/views/widgets/DropDownView.dart';
import 'package:login_tutorial/login/views/widgets/HeaderContainer.dart';

import '../../../utils/NavigationManager.dart';
import '../../../utils/Utils.dart';
import '../widgets/BottomContainer.dart';
import '../widgets/ButtonView.dart';
import '../widgets/EditTextView.dart';


class LoginRegisterView extends StatefulWidget {
  const LoginRegisterView({super.key});

  @override
  LoginRegisterViewState createState() => LoginRegisterViewState();
}

class LoginRegisterViewState extends State implements OnPressEvent, DropDownEvent {

  final int registerEvent = 300;
  final int loginEvent = 301;
  final int genderDropDownEvent = 401;
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final mobileController = TextEditingController();
  final eduController = TextEditingController();
  final passController = TextEditingController();
  final dobController = TextEditingController();
  List<String> gender = ["Male", "Female"];
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const HeaderContainer(),
            EditTextView(hintText: "Email", icon: Icons.email, controller: emailController,keyboardType: TextInputType.emailAddress,),
            DropDownView(list: gender, icon: Icons.male, hintValue: "Select Gender",
                textColor: Colors.white, eventCode: genderDropDownEvent, event: this,),
            DateTextView(hintText: "DOB", icon: Icons.celebration, controller: dobController),
            EditTextView(hintText: "City", icon: Icons.home, controller: cityController),
            EditTextView(hintText: "Mobile Number", icon: Icons.phone, controller: mobileController, keyboardType: TextInputType.phone),
            EditTextView(hintText: "College", icon: Icons.cast_for_education, controller: eduController),
            EditTextView(hintText: "Password", icon: Icons.key, controller: passController, isPassword: true,),
            ButtonView(text: "Register",event: this, eventCode: registerEvent,
              bgcolor: Colors.white, textColor: Colors.black,),
            BottomContainer(firstStr: "Already have an account",
              secondStr: "Login", event: this, eventCode: loginEvent,)
          ],
        ),
      ),
    );
  }

  checkAndValidateData() {
    String email, city, mobile, college, pass, dob;
    email = emailController.text;
    city = cityController.text;
    mobile = mobileController.text;
    college = eduController.text;
    pass = passController.text;
    dob = dobController.text;

    if(email.isEmpty || pass.isEmpty || city.isEmpty || mobile.isEmpty || college.isEmpty) {
      Utils.showToast("Field Required.");
      return;
    }
    if (!Utils.validateEmail(email)) {
      Utils.showToast("Invalid Email-ID");
      return;
    }
    if (dob.isEmpty) {
      Utils.showToast("Please select Date of birth");
      return;
    }
    if (selectedGender==null) {
      Utils.showToast("Please select gender.");
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

  @override
  void onItemSelection(int eventCode, String? item) {
    if (eventCode == genderDropDownEvent) {
      selectedGender = item;
    }
  }

}