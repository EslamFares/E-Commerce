import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference _categoriesCollectionRef =
      FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCatogry() async {
    var value = await _categoriesCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }
}
