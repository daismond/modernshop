import "dart:math";

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:modernshop/composants/ProductCard.dart";
import "package:modernshop/scoped/Mains.dart";
import "package:scoped_model/scoped_model.dart";

class HomePage extends StatefulWidget {
  final mainsScoped model;
  const HomePage({Key? key, required this.model}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return ScopedModelDescendant<mainsScoped>(
      builder: (context, child, model) {
        return Container(
          padding: EdgeInsets.all(hauteur / 100),
          child: ListView(
            children: [
              Container(
                width: largeur,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "The Ultimate Collection",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Step into style",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Container(
                  height: hauteur / 18,
                  margin: EdgeInsets.symmetric(vertical: hauteur / 100),
                  width: largeur,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.all(Radius.circular(hauteur / 35))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: hauteur / 23,
                        width: hauteur / 23,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                          width: largeur * 2.4 / 3,
                          child: TextField(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: hauteur / 55,
                                    color: Colors.grey[500]),
                                hintText: "Search Products",
                                border: InputBorder.none),
                          ))
                    ],
                  ))
            ],
          ),
        );
      },
    );
  }
}
