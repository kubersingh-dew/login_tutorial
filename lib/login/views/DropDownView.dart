import 'package:flutter/material.dart';

class DropDownEvent {
  void onItemSelection(int eventCode, String? item){}
}

class DropDownView extends StatefulWidget {
  const DropDownView({super.key, required this.list, required this.eventCode,
    this.hintValue, required this.event,
    required this.icon, this.textColor, this.imageColor});
  final String? hintValue;
  final  List<String> list;
  final IconData icon;
  final Color? textColor;
  final Color? imageColor;
  final int eventCode;
  final DropDownEvent event;
  @override
  State<StatefulWidget> createState() {
    return DropDownViewState(list, icon, hintValue, textColor, imageColor, event, eventCode);
  }

}

class DropDownViewState extends State {
  DropDownViewState(this.list, this.icon, this.hintValue,
      this.textColor, this.imageColor, this.event, this.eventCode);

  String? hintValue;
  late List<String> list;
  late IconData icon;
  Color? textColor;
  Color? imageColor;
  int eventCode;
  DropDownEvent event;

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 15, left: 25, right: 25 ),
      child: SizedBox (
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
              color: Colors.white)),
        child:Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: Icon(icon, color: Colors.white),
              ),
              Center(
                child: Padding( padding: const EdgeInsets.only(left: 40),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    alignment: Alignment.center,
                    hint: Text(hintValue??"Select", textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white54)),
                    items: list.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        alignment: Alignment.center,
                        child: Text(items,
                            style: const TextStyle(color: Colors.black)),
                      );
                    }).toList(),
                    selectedItemBuilder: (BuildContext context) =>
                        list.map<Widget>((String item) => Center(
                          child: Text(item,
                              style: const TextStyle(color: Colors.white)),
                        )).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value!;
                      });
                      event.onItemSelection(eventCode, value);
                    },
                    value: selectedValue,
                    isExpanded: true,
                  ),
                ),
              )
              ]
        )
      ),
      ),
    );
  }

}