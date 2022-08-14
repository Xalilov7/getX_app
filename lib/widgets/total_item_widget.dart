import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/state/cart_state.dart';
import 'package:getx/widgets/total_item_widget.dart';

class TotalItem extends StatelessWidget {
  String text = '', value = '';
  bool isSubTotal = false;
  final MyCardController controller;
  TotalItem({ required this.text, required this.value, required this.isSubTotal, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize:  isSubTotal? 20 : 16,
          fontWeight: FontWeight.bold,
          ),),
          Text('$value', style: TextStyle(fontSize: isSubTotal ? 20: 16, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}