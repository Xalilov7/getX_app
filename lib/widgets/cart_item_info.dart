import 'package:flutter/material.dart';
import 'package:getx/model/cart_model.dart';
import 'package:getx/state/cart_state.dart';

class CartItemInfo extends StatelessWidget {
  const CartItemInfo({
    Key? key,
    required this.cardModel,
  }) : super(key: key);

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 8, right: 8),
            child: Text(
              cardModel.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 8, right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.monetization_on_outlined, color: Colors.grey , size: 16,),
                SizedBox(width: 4),
                Text(cardModel.price,style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
