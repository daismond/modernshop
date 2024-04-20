import 'package:flutter/material.dart';
import 'package:modernshop/pages/HomeManager.dart';
import 'package:modernshop/pages/SplashPage.dart';
import 'package:modernshop/scoped/Mains.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  // Méthode pour la connexion
  final _formKey = GlobalKey<FormState>();

  // Méthode pour la connexion
  Future<void> signInWithEmailPassword(BuildContext context, String email,
      String password, mainsScoped model) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  bool afficherregister = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<mainsScoped>(
        builder: (context, child, model) {
          return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Form(
                    key: _formKey,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    MediaQuery.of(context).size.height / 5),
                                bottomRight: Radius.circular(
                                    MediaQuery.of(context).size.height / 5),
                              ),
                            ),
                            child: Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.height / 6,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/images/logo.png"))),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 50),
                            height: afficherregister
                                ? MediaQuery.of(context).size.height / 2
                                : MediaQuery.of(context).size.height / 3,
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height / 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    labelText: 'Username',
                                    border: OutlineInputBorder(gapPadding: 1),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir votre username';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    labelText: 'Mot de passe',
                                    border: OutlineInputBorder(gapPadding: 1),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir votre mot de passe';
                                    }
                                    return null;
                                  },
                                ),
                                afficherregister
                                    ? TextFormField(
                                        controller: passwordController2,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.key,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          labelText:
                                              'Confirmer le Mot de passe',
                                          border:
                                              OutlineInputBorder(gapPadding: 1),
                                        ),
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              passwordController2.text !=
                                                  passwordController.text) {
                                            return 'Veuillez saisir un mot de passe identique';
                                          }
                                          return null;
                                        },
                                      )
                                    : Center(),
                                afficherregister
                                    ? ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColor),
                                        ),
                                        onPressed: () =>
                                            signInWithEmailPassword(
                                                context,
                                                emailController.text,
                                                passwordController.text,
                                                model),
                                        child: _isLoading
                                            ? CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Text(
                                                'Créer un compte',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ))
                                    : ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColor),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isLoading = true;
                                          });
                                          model
                                              .loginUser(emailController.text,
                                                  passwordController.text)
                                              .then((value) {
                                            if (value == true) {
                                              setState(() {
                                                _isLoading = false;
                                              });
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return SplashPage();
                                                },
                                              ));
                                            } else {
                                              setState(() {
                                                _isLoading = false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Connexion échouée")));
                                            }
                                          });
                                        },
                                        child: _isLoading
                                            ? CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Text(
                                                'Connexion',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                              ],
                            ),
                          ),
                          Container(
                            height: afficherregister
                                ? MediaQuery.of(context).size.height / 8
                                : MediaQuery.of(context).size.height / 4,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                    MediaQuery.of(context).size.height / 5),
                                topLeft: Radius.circular(
                                    MediaQuery.of(context).size.height / 5),
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: afficherregister
                                    ? ElevatedButton.icon(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            afficherregister = false;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.login,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          "Se connecter",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : ElevatedButton.icon(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            afficherregister = true;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.person_add,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          "Creer un compte",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ]));
        },
      ),
    );
  }
}
