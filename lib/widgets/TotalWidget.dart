import 'package:flutter/material.dart';
import 'package:getx/state/cart_state.dart';
import 'package:getx/widgets/TotalWidget.dart';
import 'package:getx/widgets/total_item_widget.dart';
import 'package:intl/intl.dart';

class TotalWidget extends StatelessWidget {
   TotalWidget({required this.controller});
  final MyCardController controller;

  final formatCurrency = NumberFormat.simpleCurrency();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 12,
        child: Padding(padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TotalItem(
                text: "TOTAL",
                value: formatCurrency.format(controller.sumCard()),
                controller: controller,
                isSubTotal: false,
              ),
              Divider(thickness: 1),
              TotalItem(text: "Delivery Charge", 
                  value: formatCurrency.format(controller.shippingFee()),
                  isSubTotal: false, controller: controller),
              Divider(thickness: 1),
              TotalItem(text: "Sub total", value: formatCurrency.format(controller.shippingFee() + controller.sumCard()), isSubTotal: true, controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}

