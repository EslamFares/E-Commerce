import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_view.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.off(LoginView());
          },
        ),
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
                CustomText(
                  txt: 'Sign Up',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 50),
                CustomTextFormField(
                  text: 'Name',
                  hint: 'Eslam Fares',
                  onSave: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('Error Name');
                    }
                  },
                ),
                SizedBox(height: 20),
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
                    if (value.toString().length < 6) {
                      print('Error Pass < 6 letter');
                      Get.snackbar('password', 'pass Pass < 6 letter',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                ),
                SizedBox(height: 50),
                CustomButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
            
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
