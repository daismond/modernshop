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
      "Modern Shopping",
      "Immerse yourself in a new world of ultimate shopping and discovery",
      false,
      "assets/images/photo1.svg"),
  PageComposant(
      "Continuous order backup",
      "All your orders are recorded and saved automatically",
      false,
      "assets/images/photo2.svg"),
  PageComposant(
      "Secure payment",
      "We support you from ordering to secure payment.",
      true,
      "assets/images/photo3.svg"),
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
