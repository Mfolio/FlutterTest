import 'package:flutter/material.dart';
import '../model/data_model.dart';
import 'data_services.dart';

class DataClass extends ChangeNotifier {
  List<DataModel?> posts = [];

  void getPostData(List<DataModel> data) {
    this.posts = data;

    notifyListeners();
  }
}
