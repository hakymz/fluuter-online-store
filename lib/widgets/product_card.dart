import 'package:flutter/material.dart';
import 'package:online_store_app/models/product.dart';
import 'package:online_store_app/screens/product_screen.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  ProductCard(this.data);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductScreen(data)));
      },
      child: Container(
        width: 200.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[700],
                  blurRadius: 50.0,
                  spreadRadius: -40.0,
                  offset: Offset(10, 10))
            ],
            borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: data.brandName + "\n",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: data.productName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16.0))
                    ]),
                  ),
                  Text(
                    "\$" + data.price,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Positioned(
              top: 40.0,
              right: -40.0,
              child: Image(
                image: AssetImage(data.image),
                height: 180,
                width: 200.0,
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 20.0,
              child: Icon(
                data.saved ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).primaryColor,
                size: 20.0,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40.0,
                width: 60.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
