import 'package:flutter/material.dart';
import 'package:online_store_app/models/product.dart';
import 'package:online_store_app/widgets/product_card.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 300.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(productsList[index]);
          }),
    );
  }
}
