import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:modernshop/pages/DetailProductPage.dart";
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

  TextEditingController searchcontroler = TextEditingController();
  List idproduitselectionne = [];
  String categorieselectionnee = "all";
  String serchstring = "";
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return ScopedModelDescendant<mainsScoped>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image(image: AssetImage("assets/images/logo.png")),
            ),
            centerTitle: true,
            title: Text(
              "ModernShop",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: largeur / 100),
                padding: EdgeInsets.symmetric(horizontal: hauteur / 150),
                width: largeur / 4,
                height: largeur / 11.5,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius:
                        BorderRadius.all(Radius.circular(largeur / 25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: largeur / 25,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      model.getsolde.toString() + " €",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: largeur / 30,
                          color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(hauteur / 100),
            child: ListView(
              controller: ScrollController(),
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
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: hauteur / 23,
                            width: hauteur / 23,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: searchcontroler.text == ""
                                    ? Colors.white
                                    : Theme.of(context).primaryColor),
                            child: Icon(
                              Icons.search,
                              color: searchcontroler.text == ""
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Container(
                            width: largeur * 2.4 / 3,
                            child: TextField(
                              controller: searchcontroler,
                              onChanged: (value) {
                                setState(() {
                                  serchstring = value;
                                });
                              },
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: hauteur / 55,
                                      color: Colors.grey[500]),
                                  hintText: "Search Products",
                                  border: InputBorder.none),
                            ))
                      ],
                    )),
                searchcontroler.text != ""
                    ? Center()
                    : Container(
                        // color: Colors.black,
                        child: Column(
                          children: [
                            Container(
                              height: hauteur / 18,
                              width: largeur,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5000))),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      height: hauteur / 40,
                                      width: largeur * 2.2 / 3,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: hauteur / 18,
                                    width: largeur * 2.2 / 3,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(hauteur / 40),
                                          topRight:
                                              Radius.circular(hauteur / 30),
                                        )),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: largeur / 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Flash Sale",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: hauteur / 40,
                                      right: 0,
                                      child: Container(
                                        height: hauteur / 33,
                                        width: largeur * 0.68 / 3,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(
                                                    hauteur / 1))),
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              height: hauteur / 5,
                              width: largeur,
                              padding: EdgeInsets.symmetric(
                                  horizontal: largeur / 58,
                                  vertical: largeur / 60),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(hauteur / 50),
                                      bottomRight:
                                          Radius.circular(hauteur / 35),
                                      topRight: Radius.circular(hauteur / 30))),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: model.getproductofcategories
                                    .map<Widget>((prod) => GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return DetailProductPage(
                                                    produit: prod);
                                              },
                                            ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: largeur / 36),
                                            width: largeur / 2.3,
                                            height: hauteur,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            prod["thumbnail"]),
                                                    fit: BoxFit.fill),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        hauteur / 50))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(
                                                      hauteur / 200),
                                                  height: hauteur / 12,
                                                  width: largeur,
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(0.6),
                                                      borderRadius: BorderRadius
                                                          .all(Radius.circular(
                                                              hauteur / 100))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "categorye",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      hauteur /
                                                                          80),
                                                            ),
                                                            Text(
                                                              prod["rating"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      hauteur /
                                                                          80),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        prod["title"]
                                                            .toString()
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize:
                                                                hauteur / 80),
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  largeur / 4,
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      hauteur /
                                                                          350),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          hauteur /
                                                                              50))),
                                                              child: Center(
                                                                child: Text(
                                                                  prod["price"]
                                                                          .toString() +
                                                                      " €",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          hauteur /
                                                                              70),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width:
                                                                  largeur / 15,
                                                              height:
                                                                  largeur / 15,
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      hauteur /
                                                                          350),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          hauteur /
                                                                              50))),
                                                              child: Center(
                                                                  child: Icon(
                                                                Icons.add,
                                                                size: hauteur /
                                                                    45,
                                                                color: Colors
                                                                    .white,
                                                              )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                searchcontroler.text != ""
                    ? Center()
                    : Container(
                        height: hauteur / 18,
                        width: largeur,
                        //  color: Colors.green,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    categorieselectionnee = "all";
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  margin: EdgeInsets.only(
                                      right: hauteur / 100,
                                      top: hauteur / 150,
                                      bottom: hauteur / 150),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: hauteur / 100),
                                  decoration: BoxDecoration(
                                      color: categorieselectionnee == "all"
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(hauteur / 50))),
                                  child: Center(
                                      child: Text(
                                    "All",
                                    style: TextStyle(
                                        color: categorieselectionnee == "all"
                                            ? Colors.white
                                            : Theme.of(context).primaryColor),
                                  )),
                                ),
                              ),
                              ...model.getallcategories
                                  .map<Widget>((categorie) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            categorieselectionnee = categorie;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          margin: EdgeInsets.only(
                                              right: hauteur / 100,
                                              top: hauteur / 150,
                                              bottom: hauteur / 150),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: hauteur / 100),
                                          decoration: BoxDecoration(
                                              color: categorieselectionnee ==
                                                      categorie
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.grey[200],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      hauteur / 50))),
                                          child: Center(
                                              child: Text(
                                            categorie,
                                            style: TextStyle(
                                                color: categorieselectionnee ==
                                                        categorie
                                                    ? Colors.white
                                                    : Theme.of(context)
                                                        .primaryColor),
                                          )),
                                        ),
                                      ))
                                  .toList(),
                            ]),
                      ),
                model.getAllproduct
                                .where((el) =>
                                    el["category"] == categorieselectionnee)
                                .toList()
                                .length <
                            1 &&
                        categorieselectionnee != "all"
                    ? Center(
                        child: Column(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: hauteur / 6,
                          ),
                          Text(
                            "Empty",
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ))
                    : Container(
                        width: largeur,
                        height:
                            hauteur / (searchcontroler.text != "" ? 1.5 : 2),
                        child: GridView.count(
                          padding: EdgeInsets.only(bottom: hauteur / 8),
                          crossAxisCount: 2,
                          children: (searchcontroler.text != ""
                                  ? model.getAllproduct.where((prod) =>
                                      prod["title"] == searchcontroler.text)
                                  : (categorieselectionnee == "all"
                                      ? model.getAllproduct
                                      : model.getAllproduct.where((el) =>
                                          el["category"] ==
                                          categorieselectionnee)))
                              .map<Widget>((prod) => Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return DetailProductPage(
                                                  produit: prod);
                                            },
                                          ));
                                        },
                                        child: Stack(
                                          children: [
                                            AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: largeur / 60,
                                                  vertical: largeur / 60),
                                              width: largeur / 2.3,
                                              height: hauteur,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image:
                                                          CachedNetworkImageProvider(
                                                              prod[
                                                                  "thumbnail"]),
                                                      fit: BoxFit.fill),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              hauteur / 50))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.all(
                                                        hauteur / 200),
                                                    height: hauteur / 12,
                                                    width: largeur,
                                                    decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .primaryColor
                                                            .withOpacity(0.6),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    hauteur /
                                                                        100))),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "categorye",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        hauteur /
                                                                            80),
                                                              ),
                                                              Text(
                                                                prod["rating"]
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        hauteur /
                                                                            80),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                          prod["title"]
                                                              .toString()
                                                              .toUpperCase(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: hauteur /
                                                                  (prod["title"]
                                                                              .length >
                                                                          19
                                                                      ? 100
                                                                      : 80)),
                                                        ),
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width:
                                                                    largeur / 4,
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        hauteur /
                                                                            350),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(hauteur /
                                                                            50))),
                                                                child: Center(
                                                                  child: Text(
                                                                    prod["price"]
                                                                            .toString() +
                                                                        " €",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            hauteur /
                                                                                70),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: largeur /
                                                                    15,
                                                                height:
                                                                    largeur /
                                                                        15,
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        hauteur /
                                                                            350),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(hauteur /
                                                                            50))),
                                                                child: Center(
                                                                    child: Icon(
                                                                  Icons.add,
                                                                  size:
                                                                      hauteur /
                                                                          45,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (idproduitselectionne
                                                  .contains(prod["id"])) {
                                                idproduitselectionne
                                                    .remove(prod["id"]);
                                              } else {
                                                idproduitselectionne
                                                    .add(prod["id"]);
                                              }
                                            });
                                          },
                                          child: Container(
                                              height: hauteur / 18,
                                              width: hauteur / 18,
                                              decoration: BoxDecoration(
                                                // shape: BoxShape.circle,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5000)),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  idproduitselectionne
                                                          .contains(prod["id"])
                                                      ? Icons.favorite
                                                      : Icons.favorite_outline,
                                                  size: hauteur / 45,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        )),
              ],
            ),
          ),
        );
      },
    );
  }
}
