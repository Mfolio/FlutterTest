import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldDecoration extends StatelessWidget {
  final text_controller;
  final size;
  final icon;
  final hint;

  const TextFieldDecoration({super.key, required this.text_controller, this.size, this.hint, required this.icon, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height / 15,
      margin: const EdgeInsets.only(top: 9, bottom: 10),
      decoration: BoxDecoration(
          color: const Color(0XFFffffff),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: TextField(
          obscureText: hint == 'Password' ? true : false,
          controller: text_controller,
          decoration:  InputDecoration(
            prefixIcon:  Icon(icon,size: 18,),
            // border: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding:
                const EdgeInsets.only(left: 15, bottom: 13, top: 11, right: 15),
            // hintText: 'Email:',
            labelText: hint,
            labelStyle: const TextStyle(color: Colors.black45,fontSize: 15),
          ),
        ),
      ),
    );
  }
}
