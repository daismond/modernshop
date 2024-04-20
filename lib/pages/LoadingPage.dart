import "dart:async";
import "package:flutter/material.dart";
import "package:modernshop/pages/HomeManager.dart";
import "package:modernshop/pages/LoginPage.dart";
import "package:modernshop/scoped/Mains.dart";
import "package:shared_preferences/shared_preferences.dart";

class LoadingPage extends StatefulWidget {
  final mainsScoped mains;
  const LoadingPage({Key? key, required this.mains}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    widget.mains.fetchCategories();
    widget.mains.fetchProducts();

    widget.mains.fetchProductsOfCategory("smartphones");

    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString("user") != null) {
        widget.mains.setuser(prefs.getString("user").toString());
        widget.mains.fetchpanier();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeManager();
        }));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            //ajout de l'image
            ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.height / 5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
              "assets/images/logo.png",
            ))),
          ),
        ),
      ),
    );
  }
}
