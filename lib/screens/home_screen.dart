import 'package:flutter/material.dart';
import 'package:online_store_app/screens/cart_screen.dart';
import 'package:online_store_app/widgets/products.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List catergoryList = ["Popular", "Top Rated", "New Collection"];
  var selectedIndex = 0;

  Widget _categories() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 35.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catergoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Theme.of(context).primaryColor
                        : Color(0XFFF6F6F6),
                    boxShadow: selectedIndex == index
                        ? [
                            BoxShadow(
                                color: Theme.of(context).primaryColor,
                                blurRadius: 30.0,
                                spreadRadius: -12.0,
                                offset: Offset(0, 12))
                          ]
                        : null,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text(
                    catergoryList[index],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? Colors.white
                            : Color(0XFFB2B2B2)),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _bottomNav() {
    return Container(
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.bookmark),
            color: Colors.white,
            iconSize: 20.0,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.white,
            iconSize: 20.0,
            onPressed: () {},
          ),
          SizedBox(
            width: 60.0,
          ),
          IconButton(
            icon: Icon(Icons.shop),
            color: Colors.white,
            iconSize: 20.0,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.white,
            iconSize: 20.0,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.home),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
        child: _bottomNav(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
          )
        ],
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                        "Our",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 30.0),
                      ),
                      Text(
                        "Products",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[500],
                            blurRadius: 40.0,
                            offset: Offset(0, 25),
                            spreadRadius: -10)
                      ]),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          _categories(),
          Products()
        ],
      ),
    );
  }
}
