import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/model/cart_model.dart';
import 'package:getx/model/product_model.dart';
import 'package:getx/screens/cart_detials.dart';
import 'package:getx/state/cart_state.dart';
import 'package:getx/utils/utils7.dart';
import 'package:getx/widgets/product_card.dart';

void main() async{
  await GetStorage.init();
  runApp(GetMaterialApp(home: MyHomePage(),));
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(MyCardController());
  final  box = GetStorage();

   @override
   void initState(){
     super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) async {
       String cartSave = await box.read(MY_CART_KEY);
       if(cartSave.length !=0 && cartSave.isEmpty){
         final listCart = jsonDecode(cartSave) as List<dynamic>;
         final listCartParsed = listCart.map((e) => CardModel.fromJson(e)).toList();
         if(listCartParsed.length > 0)
           controller.cart.value = listCartParsed;

       }
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readJsonDatabase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator(),);
          else{
            var listProduct = snapshot.data as List<ProductModel>;
            return Padding(padding: EdgeInsets.all(8),
            child: ListView.builder(
                itemCount: listProduct.length,
                itemBuilder: (context, index) {
              return ProductCard(productModel: listProduct[index]);
            }),
            );
          }
        },
      ),
      floatingActionButton: Obx(() => Badge(
        position: BadgePosition(top: 0, end: 1),
        animationDuration: Duration(milliseconds: 200),
        animationType: BadgeAnimationType.scale,
        showBadge: true,
        badgeColor: Colors.red,
        badgeContent: Text(
          controller.cart.length > 9 ? '9+' : '${controller.cart.length}',
          style: TextStyle(color: Colors.white),
        ),
        child: FloatingActionButton(
          onPressed: () => Get.to(()=> CardDetialScreen()),
          child: Icon(Icons.add),
        ),
    ))
    );
  }
}
