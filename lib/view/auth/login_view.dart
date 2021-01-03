import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/register_view.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_button_social.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      txt: 'Welcome,',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    FlatButton(
                                          child: CustomText(
                        txt: 'Sign Up',
                        fontSize: 18,
                        color: primaryColor,
                      ),
                      onPressed: (){
                        Get.to(RegisterView());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomText(
                  txt: 'Sign in to Continue',
                  fontSize: 14,
                  color: Color(0xff929292),
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'example@gmail.com',
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('Error Email');
                    }
                  },
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  text: 'Password',
                  hint: '************',
                  hidepass: true,
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('Error Pass');
                      Get.snackbar('password', 'pass null',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                    if (value.toString().length< 6) {
                      print('Error Pass < 6 letter');
                      Get.snackbar('password', 'pass Pass < 6 letter',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                ),
                SizedBox(height: 20),
                CustomText(
                  txt: 'Forgot Password? ',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'SIGN IN',
                  onPressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                    
                  },
                ),
                SizedBox(height: 20),
                CustomText(
                  txt: '-OR-',
                  fontSize: 18,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 20),
                CustomButtonSocial(
                  onPressed: () {
                    controller.facebookSignInMethod();
                  },
                  text: 'Sign In with Facebook',
                  imageName: 'assets/images/facebook.png',
                ),
                SizedBox(height: 20),
                CustomButtonSocial(
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                  text: 'Sign In with Google',
                  imageName: 'assets/images/google.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//l267D52B6OA4GT6UbatL/Utjyeg=
