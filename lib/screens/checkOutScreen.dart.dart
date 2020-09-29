import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final products;
  final sum;

  CheckoutScreen(this.products, this.sum);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
            itemBuilder: (context, index){
              return ListTile(
                title: Text(products[index]["test"]),
                trailing: Text("\$${products[index]['mrp']}", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
                onTap: (){

                },
              );
            },
            separatorBuilder: (context, index){
              return Divider();
            },
            itemCount: products.length,
            shrinkWrap: true,
        ),
        Divider(),
        Text("Total : \$$sum"),

      ],
    );
  }
}