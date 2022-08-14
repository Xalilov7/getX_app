import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:getx/model/product_model.dart';

const MY_CART_KEY = "Cart";


Future<List<ProductModel>> readJsonDatabase()async{
  final rawData = await rootBundle.loadString("assets/data/my_project_json.json");
  final list = json.decode(rawData) as List<dynamic>;
  return list.map((e) => ProductModel.fromJson(e)).toList();
}
