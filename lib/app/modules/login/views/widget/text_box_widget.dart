import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget(
      {Key? key,
      required this.textBoxController,
      required this.hText,
      this.passwordBoxIndex})
      : super(key: key);
  final TextEditingController textBoxController;
  final String hText;
  final int? passwordBoxIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
          color: Color.fromARGB(82, 111, 251, 144),
          borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: textBoxController,
        obscureText: passwordBoxIndex == 1 ? true : false,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(5),

          hintText: hText,
          hintStyle: TextStyle(color: Color.fromARGB(128, 255, 254, 254)),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          //  prefixIcon: Icon(hintIcon)
        ),
      ),
    );
  }
}
