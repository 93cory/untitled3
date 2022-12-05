import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Cart_Products extends StatefulWidget {
  const Cart_Products({Key? key}) : super(key: key);

  @override
  State<Cart_Products> createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  var Products_on_the_cart =  [
    {
      "name": "disconnected",
      "picture": "images/produits/t1.jpeg",
      "price": 65,
      "size": "M",
      "color": "Noir",
      "quantity": 7,
    },
    {
      "name": "pull disconnected",
      "picture": "images/produits/blouson1.jpeg",
      "price": 50,
      "size": "7",
      "color": "green",
      "quantity": 3,
    },
    {
      "name": "Iphpne 14",
      "picture": "images/t4.jpeg",
      "price": 50,
      "size": "7",
      "color": "all",
      "quantity": 5,
    },

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["Nom"] ?? "",
            cart_prod_color: Products_on_the_cart[index]["Couleur"] ?? "",
            cart_prod_qty: Products_on_the_cart[index]["Quantité"] ?? "",
            cart_prod_size: Products_on_the_cart[index]["Taille"] ?? "",
            cart_prod_price: Products_on_the_cart[index]["Prix"] ?? "",
            cart_prod_pricture: Products_on_the_cart[index]["Image"] ?? "",
          );
        });
  }
}

class Single_cart_product extends StatefulWidget {
  dynamic cart_prod_name;
  dynamic cart_prod_pricture;
  dynamic cart_prod_price;
  dynamic cart_prod_size;
  dynamic cart_prod_color;
  dynamic cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_pricture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty
  });

  @override
  State<Single_cart_product> createState() => _Single_cart_productState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('cart_prod_pricture', cart_prod_pricture));
  }
}

class _Single_cart_productState extends State<Single_cart_product> {

  Single_cart_product product = Single_cart_product();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
  // ======= section principale =========
        leading: Image.asset(product.cart_prod_pricture, width: 80.0,
        height: 80.0,
        ),

 //=========== titre de la section ==========

       title: Text(product.cart_prod_name),

  // ========== section de sous-titres =======

        subtitle: Column(
          children: <Widget>[
            // lignes entre des colonnes

            Row(
          children: const <Widget>[
            // cette sectionn est pour la taille des produits
            Padding(
                padding: EdgeInsets.all(4.0),
                child: Text("Taille"),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
             // child: Text(cart_prod_size, style: TextStyle(color: Colors.blue),),
            ),

            // ========= cette section c'est pour la couleur des produits  =======

            Padding(
                padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                   child: Text("Couleur"),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
            //  child: Text(cart_prod_color, style: TextStyle(color: Colors.blue),),
            ),
        ],
      ),

//    ============= cette section est pour les prix des produits======

          Container(
            alignment: Alignment.topLeft,
            child: const Text("\${cart_prod_price}FC",
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              ),
            ),
          ),
      ],
      ),
        trailing: Column(
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.arrow_drop_up),
                onPressed: () {} ),
            Text(product.cart_prod_qty),
            IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () {} )
          ],
        ),
      ),
    );
  }

}
