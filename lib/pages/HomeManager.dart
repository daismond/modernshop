import "package:flutter/material.dart";
import "package:modernshop/pages/HomePage.dart";
import "package:modernshop/pages/OrdersPage.dart";
import "package:modernshop/pages/UserPage.dart";
import "package:modernshop/scoped/Mains.dart";
import "package:scoped_model/scoped_model.dart";

class HomeManager extends StatefulWidget {
  const HomeManager({Key? key}) : super(key: key);

  @override
  _HomeManagerState createState() => _HomeManagerState();
}

class _HomeManagerState extends State<HomeManager> {
  int curentpage = 1;
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(body: ScopedModelDescendant<mainsScoped>(
      builder: (context, child, model) {
        return Stack(
          children: [
            curentpage == 1
                ? HomePage(model: model)
                : (curentpage == 2
                    ? HomePage(model: model)
                    : (curentpage == 3 ? OrdersPage() : UserPage())),
            Positioned(
                bottom: hauteur / 50,
                child: Center(
                  child: Container(
                    width: largeur,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: hauteur / 150),
                          margin:
                              EdgeInsets.symmetric(horizontal: hauteur / 100),
                          height: hauteur / 15,
                          width: largeur * 2.3 / 3,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(hauteur / 20))),
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
                                    child: Badge(
                                      label: Text(
                                          model.getpanier.length.toString()),
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
                      ],
                    ),
                  ),
                ))
          ],
        );
      },
    ));
  }
}
