import 'package:flutter/material.dart';
import '../../constance.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({this.text, this.onPressed}) ;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(15),
      color: primaryColor,
      onPressed: onPressed,
      child: CustomText(
        txt: text,
        color: Colors.white,
        fontSize: 18,
        alignment: Alignment.center,
      ),
    );
  }
}
