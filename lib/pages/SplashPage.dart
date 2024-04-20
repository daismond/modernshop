import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import "../Composants/PageComposant.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

List<Widget> pages = [
  PageComposant(
      "Un Shopping Moderne",
      "Plongez vous dans un nouvel univers d'achat et de découverte ultime",
      false,
      "assets/images/shopping.png"),
  PageComposant(
      "Sauvegarde continue des commandes",
      "Tous vos commandes sont enregistrées et sauvegardées automatiquement",
      false,
      "assets/images/briefing.svg"),
  PageComposant(
      "Payement sécurisé",
      "Nous vous accompagnons de la commande jusqu'au payement en toute sécurité.",
      true,
      "assets/images/note-crayon.svg"),
];

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ExpandableCarousel.builder(
      itemCount: pages.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          pages[itemIndex],
      options: CarouselOptions(viewportFraction: 1),
    ));
  }
}
