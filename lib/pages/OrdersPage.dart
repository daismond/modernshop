import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:modernshop/scoped/Mains.dart";
import "package:scoped_model/scoped_model.dart";

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Order Summary",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: largeur / 100),
            padding: EdgeInsets.symmetric(horizontal: hauteur / 150),
            width: largeur / 7,
            height: largeur / 11.5,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(largeur / 25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: largeur / 25,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  "05",
                  style: TextStyle(
                      fontSize: largeur / 30,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
          ),
        ],
      ),
      body: ScopedModelDescendant<mainsScoped>(
        builder: (context, child, model) {
          return Container(
            color: Colors.grey[100],
            padding: EdgeInsets.all(hauteur / 50),
            height: hauteur,
            width: largeur,
            child: ListView(
              children: model.getpanier
                  .map<Widget>((prod) => Stack(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: hauteur / 100),
                            height: hauteur / 10,
                            width: largeur,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(hauteur / 80))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: largeur / 4.5,
                                  height: hauteur,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(hauteur / 80)),
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              prod["thumbnail"]),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  width: largeur / 1.55,
                                  height: hauteur,
                                  //color: Colors.yellow,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        prod["title"].toString().toUpperCase(),
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: largeur / 25),
                                      ),
                                      Text(
                                        prod["category"].toString(),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: largeur / 40),
                                      ),
                                      Text(
                                        prod["price"].toString() + " €",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: largeur / 30),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: largeur / 4.8,
                                height: hauteur / 28,
                                padding: EdgeInsets.all(hauteur / 200),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(hauteur / 50)),
                                ),
                                child: Container(
                                  height: hauteur / 40,
                                  width: largeur,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(hauteur / 50)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.remove,
                                        size: largeur / 25,
                                      ),
                                      Text(
                                        "99",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: hauteur / 50),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(hauteur / 500),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.add,
                                          size: largeur / 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Positioned(
                              top: hauteur / 50,
                              right: 0,
                              child: Container(
                                width: largeur / 8,
                                height: hauteur / 28,
                                padding: EdgeInsets.all(hauteur / 200),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(hauteur / 50)),
                                ),
                                child: Container(
                                  height: hauteur / 40,
                                  width: largeur,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(hauteur / 50)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(hauteur / 500),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.delete,
                                          size: largeur / 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
