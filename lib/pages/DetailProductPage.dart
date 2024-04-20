import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";

class DetailProductPage extends StatefulWidget {
  var produit;
  DetailProductPage({Key? key, required this.produit}) : super(key: key);

  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.produit["title"].toString().toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontSize: largeur / 25,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton.filled(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(hauteur / 100),
          height: hauteur,
          width: largeur,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: hauteur / 100),
                height: hauteur / 2.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            widget.produit["thumbnail"]),
                        fit: BoxFit.cover)),
              ),
              Center(
                child: Container(
                  height: hauteur / 25,
                  width: largeur / 5,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.all(Radius.circular(hauteur / 100))),
                  child: Center(
                    child: Text(
                      widget.produit["price"].toString() + " €",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: largeur / 25),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: hauteur / 100),
                width: largeur,
                padding: EdgeInsets.all(hauteur / 100),
                height: hauteur / 10,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius:
                        BorderRadius.all(Radius.circular(hauteur / 80))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: largeur / 6,
                      height: hauteur,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: hauteur / 40,
                          ),
                          Text(
                            widget.produit["rating"].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: hauteur / 45),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: hauteur,
                      color: Colors.grey[200],
                    ),
                    Container(
                      width: largeur / 6,
                      height: hauteur,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.category,
                            color: Colors.black,
                            size: hauteur / 40,
                          ),
                          Text(
                            widget.produit["category"],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: hauteur / 90),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: hauteur,
                      color: Colors.grey[200],
                    ),
                    Container(
                      width: largeur / 6,
                      height: hauteur,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.hourglass_disabled,
                            color: Colors.black,
                            size: hauteur / 40,
                          ),
                          Text(
                            "Durable",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: hauteur / 60),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: hauteur,
                      color: Colors.grey[200],
                    ),
                    Container(
                      width: largeur / 6,
                      height: hauteur,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.admin_panel_settings_rounded,
                            color: Colors.black,
                            size: hauteur / 40,
                          ),
                          Text(
                            "Adaptive",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: hauteur / 60),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: hauteur / 200),
                  child: Text(
                    widget.produit["category"],
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: largeur / 30),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: hauteur / 200),
                  child: Text(
                    widget.produit["title"],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: largeur / 15),
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.produit["description"],
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: largeur / 30),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: hauteur / 100),
                  padding: EdgeInsets.all(hauteur / 100),
                  height: hauteur / 13,
                  width: largeur,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(hauteur / 50))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Ajouter au panier",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: hauteur / 45),
                      ),
                      Text(
                        widget.produit["price"].toString() + " €",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: hauteur / 45),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
