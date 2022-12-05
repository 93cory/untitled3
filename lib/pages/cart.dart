import 'package:flutter/material.dart';

import '../componets/cart_products.dart';

// mes importations



class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,  // l'ombre sous la bare
        backgroundColor: Colors.blue,
        title: const Text('Panier'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search, color: Colors.white,), onPressed: (){} ),
        ],
      ),

      body: const Cart_Products(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const Expanded(child: ListTile(
              title: Text("Total:"),
              subtitle: Text("\230 FC"),
            )),
            
            Expanded(
                child: MaterialButton(onPressed: (){},
                child: Text("Quitter", style: TextStyle(color: Colors.white),),
                color: Colors.green,),
            )
          ],
        ),
      ),
    );
  }
}
