import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key, required this.text, required this.eventCode, required this.event, this.bgcolor,
    this.icon, this.textColor, this.imageAsset, this.imageColor});
  final String text;
  final Color? bgcolor;
  final IconData? icon;
  final Color? textColor;
  final String? imageAsset;
  final Color? imageColor;
  final OnPressEvent event;
  final int eventCode;

  Widget getChildView() {
    if (icon!=null) {
      return Icon(icon, color: Colors.white);
    } else if (imageAsset!=null && imageAsset?.isNotEmpty == true) {
      return Image(image:AssetImage(imageAsset!),
        height: 25,
        width: 25,
        color: (imageColor!=null)?imageColor:null,);
    } else {
      return const Icon(null, color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
        child: SizedBox (
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () { event.onCLick(eventCode); },
            style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: (bgcolor!=null)?bgcolor:Colors.transparent,
            shape: const StadiumBorder(),
            side: BorderSide(color: bgcolor ?? Colors.white),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15, right: 2),
              child:Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  getChildView(),
                  Padding(padding: const EdgeInsets.only(left: 25),
                    child: Center(
                        child: Text(text,
                            style: TextStyle(color: (textColor!=null)?textColor:Colors.white,
                                fontSize: 15))
                    ),
                  )
                ],
              ),
            ),
          )
        )
    );

  }

}

class OnPressEvent {
  void onCLick(int eventCode){}
}