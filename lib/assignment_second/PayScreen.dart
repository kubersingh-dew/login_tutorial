import 'package:flutter/material.dart';


class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(
              width:double.infinity,height: double.infinity),
          color: Colors.white70,
          child: SingleChildScrollView (
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[

                ]
            ),
          )
        )
    );
  }
}
