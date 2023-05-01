import 'package:flutter/material.dart';

import 'ButtonView.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key, required this.firstStr, required this.secondStr,
    required this.eventCode, required this.event});
  final String firstStr;
  final String secondStr;
  final OnPressEvent event;
  final int eventCode;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top: 25),
              child: Text(firstStr,
                style: const TextStyle(color: Colors.white,fontSize: 15),
              ),
          ),
          Padding(padding: const EdgeInsets.only(top: 15, bottom: 25),
            child: TextButton (
              child: Text(secondStr,
                style: const TextStyle(color: Colors.white, fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () { event.onCLick(eventCode); },
            )
          )
        ]
    );
  }

}