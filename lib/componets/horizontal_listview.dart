import 'package:flutter/material.dart';
import 'package:untitled3/componets/horizontal_listview.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          Category(
            image_location: 'images/produits/t1.jpeg',
            image_caption: 'tee-shirt',
          ),

          Category(
            image_location: 'images/produits/lo1.jpeg',
            image_caption: 'logo',
          ),

          Category(
            image_location: 'images/produits/Ba.jpeg',
            image_caption: 'pull Balanciaga',
          ),

          Category(
            image_location: 'images/produits/d.jpeg',
            image_caption: 'Disconnected',
          ),

          Category(
            image_location: 'images/produits/duc1.jpeg',
            image_caption: 'Whisky',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  const Category({super.key, required this.image_location, required this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 100.0,
                height: 50.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption, style: const TextStyle(fontSize: 10.0),),
              )
          ),
        ),
      ),
    );
  }
}