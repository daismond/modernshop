import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";

class ProductCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String price;
  final String rating;
  final String category;
  final String thumbnail;
  final List images;
  const ProductCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.rating,
      required this.category,
      required this.thumbnail,
      required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double largeur = MediaQuery.of(context).size.width;
    double hauteur = MediaQuery.of(context).size.height;
    return Container(
      height: hauteur / 3,
      width: largeur / 2.5,
      padding: EdgeInsets.all(hauteur / 100),
      margin: EdgeInsets.only(right: largeur / 45),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(largeur / 40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: hauteur / 5,
            width: largeur,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(thumbnail),
                    fit: BoxFit.fitHeight),
                //  color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(largeur / 25))),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_outlined)))
              ],
            ),
          ),
          Container(
            height: hauteur / 11,
            width: largeur,
            // color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price + " €",
                  style: TextStyle(
                      fontSize: largeur / 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: largeur / (title.length < 19 ? 30 : 40),
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  category,
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: largeur / 30,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
