import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:getx/state/cart_state.dart';
import 'package:getx/utils/utils7.dart';

class ChangeQuantity extends StatelessWidget {
  const ChangeQuantity({Key? key, required this.controller}) : super(key: key);
  final MyCardController  controller;
  final int  index = 0;


  @override
  Widget build(BuildContext context) {
    return ElegantNumberButton(
        initialValue: controller.cart[index].quantity,
        minValue: 0,
        maxValue: 99,
        color: Colors.white,
        onChanged: (value) async{
         controller.cart[index].quantity = value.toInt();
         saveDatabase(controller.cart);
         controller.cart.refresh();
        },
        decimalPlaces: 0);
    ;
  }
}

