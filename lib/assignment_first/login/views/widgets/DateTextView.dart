import 'package:flutter/material.dart';

class DateTextView extends StatelessWidget {
  const DateTextView({super.key, required this.hintText, required this.icon,
   required this.controller});
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

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
                    child: Padding( padding: const EdgeInsets.only(left: 25),
                      child: TextField(
                        controller: controller,
                        autofocus: false,
                        readOnly: true,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: hintText,
                          alignLabelWithHint: true,
                          hintStyle: const TextStyle(color: Colors.white54),
                          ),
                      )
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.calendar_month, color: Colors.cyan,),
                      onPressed: () { _selectDate(context); },
                    ),
                  )
                ]
            )
        ),
      ),
    );

    /*return Padding(padding: const EdgeInsets.only(top: 15, left: 25, right: 25 ),
        child: TextField(
          controller: controller,
          readOnly: true,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: hintText,
            alignLabelWithHint: true,
            hintStyle: const TextStyle(color: Colors.white54),
            prefixIcon: Icon(icon, color: Colors.white,),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.white,),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        )
    );*/

  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1700, 8),
        lastDate: DateTime.now());
    if (picked != null) {
      controller.text = "${picked.toLocal()}".split(' ')[0];
    }
  }



}