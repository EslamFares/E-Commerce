import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPressed;

  const CustomButtonSocial({this.text, this.imageName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imageName),
          CustomText(
            txt: text,
            alignment: Alignment.center,
          ),
          SizedBox()
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey, width: .7)),
    );
  }
}
