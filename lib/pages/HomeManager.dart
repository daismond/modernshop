import "package:flutter/material.dart";
import "package:modernshop/pages/HomePage.dart";
import "package:modernshop/scoped/Mains.dart";

class HomeManager extends StatefulWidget {
  const HomeManager({Key? key}) : super(key: key);

  @override
  _HomeManagerState createState() => _HomeManagerState();
}

class _HomeManagerState extends State<HomeManager> {
  mainsScoped model = mainsScoped();
  int curentpage = 1;
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "ModernShop",
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
        body: Stack(
          children: [
            curentpage == 1
                ? HomePage(model: model)
                : (curentpage == 2
                    ? HomePage(model: model)
                    : (curentpage == 3
                        ? HomePage(model: model)
                        : HomePage(model: model))),
            Positioned(
                bottom: hauteur / 50,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: hauteur / 150),
                    margin: EdgeInsets.symmetric(horizontal: hauteur / 100),
                    height: hauteur / 15,
                    width: largeur * 2.88 / 3,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.all(Radius.circular(hauteur / 20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              curentpage = 1;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: hauteur,
                            width: largeur / 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: curentpage == 1
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent),
                            child: Center(
                              child: Icon(
                                Icons.home_outlined,
                                color: curentpage == 1
                                    ? Colors.white
                                    : Colors.grey,
                                size: hauteur / 35,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              curentpage = 2;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: hauteur,
                            width: largeur / 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: curentpage == 2
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent),
                            child: Center(
                              child: Icon(
                                Icons.favorite_border,
                                color: curentpage == 2
                                    ? Colors.white
                                    : Colors.grey,
                                size: hauteur / 35,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              curentpage = 3;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: hauteur,
                            width: largeur / 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: curentpage == 3
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent),
                            child: Center(
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: curentpage == 3
                                    ? Colors.white
                                    : Colors.grey,
                                size: hauteur / 35,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              curentpage = 4;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: hauteur,
                            width: largeur / 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: curentpage == 4
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent),
                            child: Center(
                              child: Icon(
                                Icons.person_outline,
                                color: curentpage == 4
                                    ? Colors.white
                                    : Colors.grey,
                                size: hauteur / 35,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
