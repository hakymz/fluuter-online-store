import 'package:flutter/material.dart';
import 'package:online_store_app/models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  ProductScreen(this.product);

  Widget _star(starsNum) {
    List<Widget> list = new List();
    for (int i = 0; i < 5; i++) {
      list.add(Icon(
        Icons.star,
        size: 13,
        color: i + 1 <= starsNum ? Color(0XFFFEC247) : Color(0XFFE5E5E5),
      ));
    }

    return Row(children: list);
  }

  Widget _bottomNav(context) {
    return Container(
      height: 100.0,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Quantity"),
                Container(
                  width: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                            color: Color(0XFF9F9F9F),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                      ),
                      Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                            color: Color(0XFF9F9F9F),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(
                            "10",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11.0),
                          ),
                        ),
                      ),
                      Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                            color: Color(0XFF9F9F9F),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 2.0,
                ),
                Text(
                  "Add To My Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Online Store",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Theme.of(context).primaryColor),
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar: _bottomNav(context),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0),
              height: 300.0,
              child: Image(
                image: AssetImage(product.image),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 430.0 > 0
                      ? MediaQuery.of(context).size.height - 430.0
                      : MediaQuery.of(context).size.height - 300.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      top: -50,
                      right: -10,
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[600],
                                  blurRadius: 30.0,
                                  spreadRadius: -15,
                                  offset: Offset(0, 15))
                            ]),
                        child: Icon(
                          product.saved
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.brandName + " " + product.productName,
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 20.0,
                              child: Row(
                                children: <Widget>[
                                  _star(product.stars),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "56 Reviews",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0XFF9F9F9F)),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "\$" + product.price,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            product.description,
                            style: TextStyle(fontSize: 15.0, height: 1.5),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
