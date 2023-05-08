import 'package:flutter/material.dart';

class EditTextView extends StatelessWidget {
  const EditTextView({super.key, required this.hintText, required this.icon,
    this.controller, this.isPassword, this.keyboardType});
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final bool? isPassword;
  final TextInputType? keyboardType;



  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 15, left: 25, right: 25 ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: isPassword ?? false,
          enableSuggestions: isPassword ?? true,
          autocorrect: isPassword ?? true,
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
    );

  }

}