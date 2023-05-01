import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Welcome",
            style: TextStyle(color: Colors.white,fontSize: 35),
          ),
          Text("Join Mr BookWarm!",
            style: TextStyle(color: Colors.white,fontSize: 20),
          ),
        ]
    );
  }

}