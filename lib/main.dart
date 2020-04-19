import 'package:cardappshop/Screens/Checkoutscreen.dart';
import 'package:cardappshop/Screens/productscreen.dart';
import 'package:cardappshop/productmodel.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardApp(),
    );
  }
}
class CardApp extends StatefulWidget {
  @override
  _CardAppState createState() => _CardAppState();
}

class _CardAppState extends State<CardApp> {
  List<Productmodel> cart = [];
  int sum;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.teal,
          title: new Text('Card Application'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                 child: new Text( 'Products',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)
              ),
              Tab(
                  child: new Text( 'Checkout',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen((selectedProduct){
              setState(() {
                cart.add(selectedProduct);//update
                sum = 0;
                cart.forEach((item){
                  sum = sum + item.price;
                });
              });
            }),
            CheckoutScreen(cart, sum),
          ],
        ),
      ),
    );
  }
}

