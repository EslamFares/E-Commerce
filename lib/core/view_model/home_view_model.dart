import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/home_services.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategories();
    getBestSellingProducts();
  }
  getCategories() async {
    _loading.value = true;
    HomeServices().getCatogry().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        // print(_categoryModel.length);
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeServices().getBestSelling().then((value) {
     for(int i = 0; i<value.length;i++){
       _productModel.add(ProductModel.fromJson(value[i].data()));
       // print('productModel ========>${_productModel.length}');
       _loading.value = false;
     }
     update();
    });
  }
}
