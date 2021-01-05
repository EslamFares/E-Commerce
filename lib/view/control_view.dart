import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/core/view_model/home_view_model.dart';

// ignore: must_be_immutable
class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<HomeviewModel>(
              init: HomeviewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<HomeviewModel>(
      init: HomeviewModel(),
      builder: (controller) => BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 10,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              activeIcon: activeTextBottomNaigation('Explor'),
              label: ' ',
              icon: Image.asset(
                'assets/bottom_icon/Icon_Explore.png',
                fit: BoxFit.contain,
                width: 18,
              )),
          BottomNavigationBarItem(
              activeIcon: activeTextBottomNaigation('Cart'),
              label: ' ',
              icon: Image.asset(
                'assets/bottom_icon/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 18,
              )),
          BottomNavigationBarItem(
              activeIcon: activeTextBottomNaigation('Account'),
              label: ' ',
              icon: Image.asset(
                'assets/bottom_icon/Icon_User.png',
                fit: BoxFit.contain,
                width: 18,
              )),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);

          print(index);
        },
      ),
    );
  }

  Column activeTextBottomNaigation(String text) {
    return Column(
      children: [
        Text(text),
        SizedBox(height: 5),
        Container(
          width: 3.5,
          height: 3.5,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(50.0)),
        )
      ],
    );
  }
}
