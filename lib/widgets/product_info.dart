import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/model/cart_model.dart';
import 'package:getx/model/product_model.dart';
import 'package:getx/state/cart_state.dart';
import 'package:getx/utils/utils7.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo({Key? key, this.productModel}) : super(key: key);
  final ProductModel? productModel;

  final controller = Get.put(MyCardController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child:  Column (
        children: [
          Text(
            "${productModel!.name}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: double.parse(productModel!.oldPrice) == 0
                        ? ""
                        : "\$${productModel!.price}",
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough)),
                TextSpan(text: "\$${productModel!.price}")
              ])),
              InkWell(onTap: ()async{
                var cartItem = CardModel(
                    id: productModel!.id,
                    name: productModel!.name,
                    oldPrice: productModel!.oldPrice,
                    price: productModel!.price,
                    imgUrl: productModel!.imageUrl,
                    category: productModel!.category,
                    quantity: 1);
                if(isExistsInCart(controller.cart, cartItem)){
                  var indexUpdate = controller.cart.indexWhere((e) => e.id == productModel!.id);
                  var productUpdate = controller.cart.firstWhere((element) => element.id == productModel!.id);
                  productUpdate.quantity += 1;
                  controller.cart.insert(indexUpdate, productUpdate);
                }else controller.cart.add(cartItem);
                var jsonDBEncoded = jsonEncode(controller.cart);
                await box.write(MY_CART_KEY, jsonDBEncoded);
                controller.cart.refresh();

              },   child: Icon(Icons.add_shopping_cart),)
            ],
          )
        ],
      ),
    );
  }

  bool isExistsInCart(RxList<CardModel> cart, CardModel cartItem) {
    return cart.contains(cartItem);
  }
  }


