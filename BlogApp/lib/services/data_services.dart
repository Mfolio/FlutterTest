import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/data_model.dart';

class Helper {
  int list_lenght = 0;
  List list1 = [];

  Future<List<DataModel>> getData() async {
    DataModel? result;
    List<DataModel> list = [];
    try {
      final response = await http.get(
        Uri.parse("https://bloggy-api.herokuapp.com/posts"),
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        for (var element in data) {
          DataModel model = DataModel(id: element['id'], title: element['title'], body: element['body']);
          list.add(model);
          list_lenght = list.length;
        }
        return list;
      } else {
        // ignore: avoid_print
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return list;
  }
}
