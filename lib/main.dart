import 'package:flutter/material.dart';
import 'package:modernshop/pages/LoadingPage.dart';
import 'package:modernshop/scoped/Mains.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  mainsScoped mains = mainsScoped();

  Widget build(BuildContext context) {
    return ScopedModel(
        model: mains,
        child: MaterialApp(
          title: 'modernshop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.black,
              // const Color.fromARGB(255, 87, 19, 206)),
              useMaterial3: true,
              textTheme: TextTheme(
                  titleLarge: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 10,
                      fontWeight: FontWeight.bold),
                  titleMedium: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 15,
                      fontWeight: FontWeight.bold),
                  titleSmall: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 25,
                      fontWeight: FontWeight.normal),
                  bodyMedium: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 25,
                      fontWeight: FontWeight.normal))),
          home: LoadingPage(
            mains: mains,
          ),
        ));
  }
}
