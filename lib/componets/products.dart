import 'package:flutter/material.dart';

import '../pages/products_details.dart';


class Products extends StatefulWidget {
  var images;

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "disconnected",
      "picture": "images/produits/t1.jpeg",
      "old_price": 90,
      "price": 65,
    },
    {
      "name": "pull balanciaga",
      "picture": "images/produits/Ba.jpeg",
      "old_price": 75,
      "price": 55,
    },

    {
      "name": "blazer disconnected",
      "picture": "images/produits/blouson1.jpeg",
      "old_price": 75,
      "price": 55,
    },
    {
      "name": "casquette",
      "picture": "images/produits/Ca1.jpeg",
      "old_price": 75,
      "price": 55,
    },
    {
      "name": "logo disconnected",
      "picture": "images/produits/lo2.png",
      "old_price": 75,
      "price": 55,
    },
    {
      "name": "Duc",
      "picture": "images/produits/duc4.jpeg",
      "old_price": 75,
      "price": 55,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
          itemCount: product_list.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Single_prod(
                prod_name: product_list[index]['name'] ?? "",
                prod_pricture: product_list[index]['picture'] ?? "",
                prod_old_price: product_list[index]['old_price'] ?? "",
                prod_price: product_list[index]['price'] ?? "",
              ),
            );
          }),
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: ()=> Navigator.of(context).push(
                  MaterialPageRoute(
                    // ici nous avons les valeurs et details des fiches produits
                      builder: (context) => ProductDetails(
                        product_details_name: prod_name ,
                        product_details_new_price: prod_price,
                        product_details_old_price: prod_old_price,
                        product_details_picture: prod_pricture,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(prod_name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                        ),

                        Text("\f$prod_price Fc", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                      ],
                    )
                  ),
                  child: Image.asset(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
