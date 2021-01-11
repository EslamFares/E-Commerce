import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:e_commerce/view/cart_view.dart';
import 'package:e_commerce/view/profile_view.dart';

class ControleviewModel extends GetxController {
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;
  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;
  void changeSelectedValue(int selectValue) {
    switch (selectValue) {
      case 0:
        _currentScreen = HomeView();

        break;

      case 1:
        _currentScreen = CartView();

        break;

      case 2:
        _currentScreen = ProfileView();

        break;

      default:
        _currentScreen = HomeView();
    }
    _navigatorValue = selectValue;
    update();
  }
}
