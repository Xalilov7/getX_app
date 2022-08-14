import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/state/cart_state.dart';
import 'package:getx/widgets/TotalWidget.dart';
import 'package:getx/widgets/cart_item_info.dart';
import 'package:getx/widgets/product_img.dart';
import 'package:intl/intl.dart';

class CardDetialScreen extends StatelessWidget {
  CardDetialScreen({Key? key}) : super(key: key);
  final box = GetStorage();
  MyCardController controller = Get.find();
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
        centerTitle: true,
      ),
      body: Obx(() => Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: controller.cart.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ProducImage(
                                      productModel: controller.cart[index],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 6,
                                      child: CartItemInfo(cardModel: controller.cart[index])
                                  )
                                ],
                              ),
                            ),
                          ),

                        );
                      })),
              TotalWidget(controller: controller,),
            ],
          )),
    );
  }
}


