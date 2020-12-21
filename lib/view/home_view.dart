import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            _auth.signOut();
            Get.offAll(LoginScreen());
          },
          child: Text('LogOut'),
          color: Colors.red,
        ),
      ),
    );
  }
}
