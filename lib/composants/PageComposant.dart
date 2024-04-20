import "package:flutter/material.dart";
import "package:modernshop/scoped/Mains.dart";
import "package:scoped_model/scoped_model.dart";
import "../Pages/HomePage.dart";
import "package:shared_preferences/shared_preferences.dart";

// ignore: must_be_immutable
class PageComposant extends StatelessWidget {
  String titre;
  String description;
  bool dernier;
  String image;
  PageComposant(this.titre, this.description, this.dernier, this.image,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<mainsScoped>(
      builder: (context, child, model) {
        return ScopedModelDescendant<mainsScoped>(
          builder: (context, child, model) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Container(
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.height / 2,
                                //    color: Theme.of(context).primaryColorDark,
                                child: Image.asset(
                                  image,
                                )),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height / 30),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  titre,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              30),
                                ),
                              ),
                              Center(
                                child: Text(
                                  description,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              45),
                                ),
                              ),
                            ],
                          ),
                        ),
                        dernier
                            ? ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.all(
                                            MediaQuery.of(context).size.width /
                                                30)),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Theme.of(context).primaryColorDark)),
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setBool("description", true);
                                  //  model.fetchlivres();
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomePage(
                                      model: model,
                                    );
                                  }));
                                },
                                child: Text(
                                  "Commencer",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              35,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                            : const Center()
                      ],
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.height / 8,
                        child: IconButton(
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool("description", true);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomePage(
                                  model: model,
                                );
                              }));
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height / 30,
                            ))),
                  ],
                ));
          },
        );
      },
    );
  }
}
