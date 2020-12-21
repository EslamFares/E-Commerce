import 'package:e_commerce/constance.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final Function onSave;
  final Function validator;
  final bool hidepass;

  const CustomTextFormField(
      {this.text, this.hint, this.onSave, this.validator, this.hidepass = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            txt: text,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            obscureText: hidepass,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 0.0),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade700),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
