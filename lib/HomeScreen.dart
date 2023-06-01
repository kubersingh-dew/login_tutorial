import 'package:flutter/material.dart';
import 'package:login_tutorial/assignment_first/utils/NavigationManager.dart';

import 'assignment_first/login/views/widgets/ButtonView.dart';

class HomeScreen extends StatelessWidget implements OnPressEvent {
  HomeScreen({super.key});
  static const int assign1 = 208;
  static const int assign2 = 209;
  static const int assign3 = 210;
  late BuildContext cx;


  @override
  Widget build(BuildContext context) {
    cx = context;
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.rectangle,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonView(text: "Assignment 1",event: this, eventCode: assign1,
                    bgcolor: Colors.white, textColor: Colors.black,),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ButtonView(text: "Assignment 2",event: this, eventCode: assign2,
                    bgcolor: Colors.white, textColor: Colors.black,),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ButtonView(text: "Assignment 3",event: this, eventCode: assign3,
                    bgcolor: Colors.white, textColor: Colors.black,),
                ]
            )
        )
    );
  }

  @override
  void onCLick(int eventCode) {
    if (eventCode == assign1) {
      NavigationManager.navigateToBasePage(cx);
    } else if (eventCode == assign2) {
      NavigationManager.navigateToAssignSecond(cx);
    } else if (eventCode == assign3) {
      NavigationManager.navigateToAssignThree(cx);
    }
  }
}
