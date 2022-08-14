import 'package:flutter/material.dart';
import 'package:getx/model/product_model.dart';

class CardModel extends ProductModel{
  int quantity =0;
  CardModel({id, name, category, imgUrl, oldPrice, price, required this.quantity}) :super(

    id: id,
    name: name,
    category: category,
    imageUrl: imgUrl,
    oldPrice: oldPrice,
    price: price
  );
  factory CardModel.fromJson(Map<String, dynamic> json){
    final product = ProductModel.fromJson(json);
    final quantity = json['quantity'];
    return CardModel(
      id: product.id,
      name: product.name,
      category: product.category,
      imgUrl: product.imageUrl,
      oldPrice: product.oldPrice,
      price: product.price,
      quantity: quantity
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["category"]= this.category;
    data["imgUrl"] = this.imageUrl;
    data["oldPrice"] = this.oldPrice;
    data["price"] = this.price;
    data["quantity"]= this.quantity;
    return data;
  }
}