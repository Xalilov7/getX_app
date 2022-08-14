import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getx/model/product_model.dart';


class ProducImage extends StatelessWidget {
  const ProducImage({Key? key, required this.productModel}) : super(key: key);
  final ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: productModel!.imageUrl,
      fit: BoxFit.cover,
    errorWidget: (context, url, error)=> Icon(Icons.image),
    progressIndicatorBuilder: (context, url, downloadProgress)=> Padding(padding: EdgeInsets.all(16),
    child: Center(
      child: CircularProgressIndicator(),
    ),
    ),
    );
  }
}
