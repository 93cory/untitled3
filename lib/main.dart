import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';


//mes importations
import 'package:untitled3/pages/cart.dart';
import 'package:untitled3/pages/products_details.dart';
import 'componets/horizontal_listview.dart';






void main() {
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      )
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
    Widget imageCarousel = SizedBox(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images:  [
          Image.asset('images/e1.jpeg'),
          Image.asset('images/e2.jpeg'),
          Image.asset('images/e3.jpeg'),
          Image.asset('images/h1.jpeg'),
          Image.asset('images/h2.jpeg'),
          Image.asset('images/h3.jpeg'),
          Image.asset('images/h4.jpeg'),
          Image.asset('images/h5.jpeg'),
          Image.asset('images/t1.jpeg'),
          Image.asset('images/t2.jpeg'),
          Image.asset('images/t3.jpeg'),
          Image.asset('images/t4.jpeg'),
          Image.asset('images/t5.jpeg'),
          Image.asset('images/v1.jpeg'),
          Image.asset('images/v2.jpeg'),
          Image.asset('images/v3.jpeg'),
          Image.asset('images/v4.jpeg'),
          Image.asset('images/v5.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: const Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,  // hombre sous la bare
        backgroundColor: Colors.blue,
        title: const Text('NzengApp'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ), onPressed: (){} ),
          IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Cart()));
          } )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //           header
            UserAccountsDrawerHeader(
              accountName: const Text('Cory MBA'),
              accountEmail: const Text('corymba@gmail.com'),
              currentAccountPicture: GestureDetector(
                  child: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white,),
                  )
              ),
              decoration: const BoxDecoration(
                  color: Colors.blue
              ),
            ),
            // body

            InkWell(
              onTap: (){},
              child: const ListTile(
                title: Text('Accueil'),
                leading: Icon(Icons.home, color: Colors.cyanAccent,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: const ListTile(
                title: Text('Mes commandes '),
                leading: Icon(Icons.shopping_basket, color: Colors.orange,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: const ListTile(
                title: Text('Favoris'),
                leading: Icon(Icons.favorite, color: Colors.pink,),
              ),
            ),

            InkWell(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> const Cart()));
              },
              child: const ListTile(
                title: Text('Panier'),
                leading: Icon(Icons.shopping_cart, color: Colors.green,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: const ListTile(
                title: Text('Mon compte'),
                leading: Icon(Icons.person, color: Colors.brown,),
              ),
            ),

            const Divider(),

            InkWell(
              onTap: (){},
              child: const ListTile(
                title: Text('Paramètres'),
                leading: Icon(Icons.settings, color: Colors.grey,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: const ListTile(
                title: Text('a propos'),
                leading: Icon(Icons.help, color: Colors.blue,),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: imageCarousel,
          ),
          SliverToBoxAdapter(
            child: Padding(padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Catégories')),),
          ),
          const SliverToBoxAdapter(
            child: HorizontalList(),
          ),
          SliverToBoxAdapter(
            child: Padding(padding: const EdgeInsets.all(20.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Recents')),),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  child: Hero(
                      tag: product_list[0]["name"] ?? "",
                      child: Material(
                        child: InkWell(
                          onTap: ()=> Navigator.of(context).push(
                              MaterialPageRoute(
                                // ici nous avons les valeurs et details des fiches produits
                                  builder: (context) => ProductDetails(
                                    product_details_name: product_list[0]["name"] ?? "" ,
                                    product_details_new_price: product_list[0]["price"] ?? "",
                                    product_details_old_price: product_list[0]["old_price"] ?? "",
                                    product_details_picture: product_list[0]["picture"] ?? "",
                                  ))),
                          child: GridTile(
                              footer: Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(product_list[0]["name"].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                                      ),

                                      Text("${product_list[0]["price"]} Fcfa", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              ),
                              child: Image.asset(
                                product_list[0]["picture"].toString(),
                                fit: BoxFit.cover,
                              )),
                        ),
                      )),
                ),
                Card(
                  child: Hero(
                      tag: product_list[1]["name"] ?? "",
                      child: Material(
                        child: InkWell(
                          onTap: ()=> Navigator.of(context).push(
                              MaterialPageRoute(
                                // ici nous avons les valeurs et details des fiches produits
                                  builder: (context) => ProductDetails(
                                    product_details_name: product_list[1]["name"] ?? "" ,
                                    product_details_new_price: product_list[1]["price"] ?? "",
                                    product_details_old_price: product_list[1]["old_price"] ?? "",
                                    product_details_picture: product_list[1]["picture"] ?? "",
                                  ))),
                          child: GridTile(
                              footer: Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(product_list[1]["name"].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                                      ),

                                      Text("${product_list[1]["price"]} Fcfa", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              ),
                              child: Image.asset(
                                product_list[1]["picture"].toString(),
                                fit: BoxFit.cover,
                              )),
                        ),
                      )),
                ),

                Card(
                  child: Hero(
                      tag: product_list[2]["name"] ?? "",
                      child: Material(
                        child: InkWell(
                          onTap: ()=> Navigator.of(context).push(
                              MaterialPageRoute(
                                // ici nous avons les valeurs et details des fiches produits
                                  builder: (context) => ProductDetails(
                                    product_details_name: product_list[2]["name"] ?? "" ,
                                    product_details_new_price: product_list[2]["price"] ?? "",
                                    product_details_old_price: product_list[2]["old_price"] ?? "",
                                    product_details_picture: product_list[2]["picture"] ?? "",
                                  ))),
                          child: GridTile(
                              footer: Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(product_list[2]["name"].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                                      ),

                                      Text("${product_list[2]["price"]} Fcfa", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              ),
                              child: Image.asset(
                                product_list[2]["picture"].toString(),
                                fit: BoxFit.cover,
                              )),
                        ),
                      )),
                ),
                Card(
                  child: Hero(
                      tag: product_list[3]["name"] ?? "",
                      child: Material(
                        child: InkWell(
                          onTap: ()=> Navigator.of(context).push(
                              MaterialPageRoute(
                                // ici nous avons les valeurs et details des fiches produits
                                  builder: (context) => ProductDetails(
                                    product_details_name: product_list[3]["name"] ?? "" ,
                                    product_details_new_price: product_list[3]["price"] ?? "",
                                    product_details_old_price: product_list[3]["old_price"] ?? "",
                                    product_details_picture: product_list[3]["picture"] ?? "",
                                  ))),
                          child: GridTile(
                              footer: Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(product_list[3]["name"].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                                      ),

                                      Text("${product_list[3]["price"]} Fcfa", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              ),
                              child: Image.asset(
                                product_list[3]["picture"].toString(),
                                fit: BoxFit.cover,
                              )),
                        ),
                      )),
                ),
                Card(
                  child: Hero(
                      tag: product_list[4]["name"] ?? "",
                      child: Material(
                        child: InkWell(
                          onTap: ()=> Navigator.of(context).push(
                              MaterialPageRoute(
                                // ici nous avons les valeurs et details des fiches produits
                                  builder: (context) => ProductDetails(
                                    product_details_name: product_list[4]["name"] ?? "" ,
                                    product_details_new_price: product_list[4]["price"] ?? "",
                                    product_details_old_price: product_list[4]["old_price"] ?? "",
                                    product_details_picture: product_list[4]["picture"] ?? "",
                                  ))),
                          child: GridTile(
                              footer: Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(product_list[4]["name"].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                                      ),

                                      Text("${product_list[4]["price"]} Fcfa", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              ),
                              child: Image.asset(
                                product_list[4]["picture"].toString(),
                                fit: BoxFit.cover,
                              )),
                        ),
                      )),
                ),
                Card(
                  child: Hero(
                      tag: product_list[5]["name"] ?? "",
                      child: Material(
                        child: InkWell(
                          onTap: ()=> Navigator.of(context).push(
                              MaterialPageRoute(
                                // ici nous avons les valeurs et details des fiches produits
                                  builder: (context) => ProductDetails(
                                    product_details_name: product_list[5]["name"] ?? "" ,
                                    product_details_new_price: product_list[5]["price"] ?? "",
                                    product_details_old_price: product_list[5]["old_price"] ?? "",
                                    product_details_picture: product_list[5]["picture"] ?? "",
                                  ))),
                          child: GridTile(
                              footer: Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(product_list[5]["name"].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                                      ),

                                      Text("${product_list[5]["price"]} Fcfa", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                                    ],
                                  )
                              ),
                              child: Image.asset(
                                product_list[5]["picture"].toString(),
                                fit: BoxFit.cover,
                              )),
                        ),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.green[500],
                  child: const Text('Revolution is coming...'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

