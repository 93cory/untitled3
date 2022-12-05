import 'package:flutter/material.dart';
import '../main.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_new_price;
  final product_details_old_price;
  final product_details_picture;

  const ProductDetails({super.key,
    this.product_details_name,
    this.product_details_new_price,
    this.product_details_old_price,
    this.product_details_picture,

});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}


class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0.1,  // l'ombre sous la bare
        backgroundColor: Colors.blue,
        title: InkWell(

            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));},
            child: const Text('NzengApp')),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search,
                color: Colors.white,), onPressed: (){}
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 300.0,
            child: GridTile(
                footer: Container(
                color: Colors.white70,
              child: ListTile(
                leading: Text(widget.product_details_name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                title: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text("\f${widget.product_details_old_price} Fc",
                       style: const TextStyle(color: Colors.grey, decoration:  TextDecoration.lineThrough), )
                    ),
                    Expanded(
                        child: Text("\f${widget.product_details_new_price} Fc", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),)
                    ),
                  ],
                ),
              ),
            ),
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_details_picture),
                )
            ),
          ),


          //              les premiers boutons
          Row(
            children: <Widget>[
              // la taille des boutons
              Expanded(
                child:MaterialButton(
                  onPressed: (){
                 showDialog(context: context,
                 builder: (context){
                   return AlertDialog(
                     title: const Text("Taille"),
                     content: const Text("Choisir la taille"),
                     actions: <Widget>[
                       MaterialButton(onPressed: (){
                         Navigator.of(context).pop(context);
                       },
                       child: const Text("fermer"),
                       )
                     ],
                   );
                 });
                },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                          child: Text("Taille")
                      ),

                      Expanded(
                          child: Icon(Icons.arrow_drop_down)
                      ),
                    ],
                  ),
                ),
              ),

              // la taille des boutons
              Expanded(
                child:MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            title: const Text("Couleur"),
                            content: const Text("Choisir la couleur"),
                            actions: <Widget>[
                              MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: const Text("fermer"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                          child: Text("Couleurs")
                      ),

                      Expanded(
                          child: Icon(Icons.arrow_drop_down)
                      ),
                    ],
                  ),
                ),
              ),

              // la taille des boutons
              Expanded(
                child:MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            title: const Text("Quantité"),
                            content: const Text("Choisir la quantité"),
                            actions: <Widget>[
                              MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: const Text("fermer"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                          child: Text("Quantité")
                      ),

                      Expanded(
                          child: Icon(Icons.arrow_drop_down)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),



          //              les deuxiemes boutons
          Row(
            children: <Widget>[
              // la taille des boutons
              Expanded(
                child:MaterialButton(onPressed: (){},
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: const Text("Payer maintenent")
                ),
              ),

              IconButton(icon: const Icon(Icons.add_shopping_cart, color: Colors.blue,),onPressed: (){}),
              IconButton(icon: const Icon(Icons.favorite_border), color: Colors.blue,onPressed: (){}),
            ],
          ),
          const Divider(color: Colors.blue,),
          const ListTile(
            title: Text("descriptions"),
            subtitle: Text("- Tee noir "
                "- Logos jaune et rose imprimés "
                "- Coupe classique ") ,
          ),
          const Divider(),
      Row(
        children: <Widget>[
          const Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
          child: Text("nom du produit", style: TextStyle(color: Colors.grey),),),
          Padding(padding: const EdgeInsets.all(5.0),
          child: Text(widget.product_details_name),)
        ],
      ),

          Row(
            children:  const <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("marque du produit", style: TextStyle(color: Colors.grey),),),

              // Ne pass oublier de creer la marque du produit
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("Marque X"),)
            ],
          ),

          // Ajouter les details du produit
          Row(
            children: const <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Etat du produit", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("Nouveau"),)
            ],
          ),

          const Divider(),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Produits similaires"),
    ),



          //rubrique des produits similaires
         const SizedBox(
           height: 340.0,
           child: Similar_products(),
         )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  const Similar_products({Key? key}) : super(key: key);

  @override
  State<Similar_products> createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      "name": "disconnected",
      "picture": "images/produits/t1.jpeg",
      "old_price": 90,
      "price": 65,
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
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_single_prod(
            prod_name: product_list[index]['name'],
            prod_pricture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}


class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Similar_single_prod({
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

