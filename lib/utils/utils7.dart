import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/model/cart_model.dart';
import 'package:getx/model/product_model.dart';

const MY_CART_KEY = "Cart";


Future<List<ProductModel>> readJsonDatabase()async{
  final rawData = await rootBundle.loadString("assets/data/my_project_json.json");
  final list = json.decode(rawData) as List<dynamic>;
  return list.map((e) => ProductModel.fromJson(e)).toList();
}
void saveDatabase(RxList<CardModel> cart){
var box = GetStorage();
box.write(MY_CART_KEY, jsonEncode(cart));
}
