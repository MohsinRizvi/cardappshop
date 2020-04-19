import 'package:cardappshop/productmodel.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final ValueSetter<Productmodel> _valueSetter;

  ProductScreen(this._valueSetter);
  List <Productmodel> products =[
    Productmodel('Laptops',500000),
    Productmodel('Iphones',1000000),
    Productmodel('Garments',10000),
    Productmodel('SpareParts',2500),
    Productmodel('Machines',10000),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index){
          return ListTile(
            title: Text(products[index].name),
            trailing: new Text('${products[index].price}',style:TextStyle(color: Colors.cyan, fontSize: 20,fontWeight: FontWeight.w700)  ,),
            onTap: (){
              _valueSetter(products[index]);
            },

          );
        },
        separatorBuilder:(context ,index){
        return  Divider();
        },
         itemCount: products.length,);
  }
}
