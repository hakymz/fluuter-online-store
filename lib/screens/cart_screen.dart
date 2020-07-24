import 'package:flutter/material.dart';
import 'package:online_store_app/models/product.dart';

class CartScreen extends StatelessWidget {
  Widget _products() {
    return (Expanded(
      child: Container(
        child: ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 80.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.0),
                                  bottomRight: Radius.circular(50.0))),
                          child: Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Positioned(
                                right: 0,
                                top: -30,
                                child: Image(
                                  height: 120.0,
                                  width: 100.0,
                                  image: AssetImage(productsList[index].image),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          height: 80.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                productsList[index].brandName +
                                    " " +
                                    productsList[index].productName,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "\$" + productsList[index].price,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 70.0,
                      padding: EdgeInsets.only(right: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 18.0,
                            width: 18.0,
                            decoration: BoxDecoration(
                                color: Color(0XFF9F9F9F),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                          ),
                          Container(
                            height: 22.0,
                            width: 22.0,
                            decoration: BoxDecoration(
                                color: Color(0XFF9F9F9F),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text(
                                "10",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0),
                              ),
                            ),
                          ),
                          Container(
                            height: 18.0,
                            width: 18.0,
                            decoration: BoxDecoration(
                                color: Color(0XFF9F9F9F),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    ));
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
                Text("3items"),
                Text(
                  "\$100",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 2.0,
                ),
                Text(
                  "Proceed To Cart",
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
      theme: ThemeData(primaryColor: Theme.of(context).primaryColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: _bottomNav(context),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 70.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Shopping",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 30.0),
                        ),
                        Text(
                          "Cart",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            _products()
          ],
        ),
      ),
    );
  }
}
