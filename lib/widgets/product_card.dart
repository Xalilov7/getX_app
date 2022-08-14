import 'package:flutter/material.dart';
import 'package:getx/model/product_model.dart';
import 'package:getx/widgets/product_img.dart';
import 'package:getx/widgets/product_info.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Column(
        children: [
          ProducImage(productModel: productModel),
          ProductInfo(productModel: productModel),
        ],
      ),
    );
  }
}
