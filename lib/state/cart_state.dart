import 'package:get/get.dart';
import 'package:getx/model/cart_model.dart';

class MyCardController extends GetxController{
  var cart = List<CardModel>.empty(growable: true).obs;

  sumCard(){
    return cart.map((e) => double.parse(e.price)).reduce((previousValue, element) => previousValue + element);
  }


  shippingFee(){
   return sumCard() * 0.1;
   }

}