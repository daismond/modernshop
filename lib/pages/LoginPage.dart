import 'package:flutter/material.dart';
import 'package:modernshop/pages/SplashPage.dart';
import 'package:modernshop/scoped/Mains.dart';
import 'package:scoped_model/scoped_model.dart';

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
  Future signInWithEmailPassword(BuildContext context, String email,
      String password, mainsScoped model) async {
    if (!_formKey.currentState!.validate()) {
      print("cest pas  verifier");
      return;
    } else {
      setState(() {
        _isLoading = true;
      });
      print("cest verifier");
      model.CreateUser(email, password).then((value) {
        if (value == true) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return SplashPage();
            },
          ));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("We encountered an error")));
        }
      });
    }
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
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Form(
                    key: _formKey,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 3.18,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              //   color: Colors.black,
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
                          Center(
                            child: Text(
                              "ModernShop",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Container(
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
                                      return 'Please enter your username';
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
                                    labelText: 'Password',
                                    border: OutlineInputBorder(gapPadding: 1),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
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
                                          labelText: 'Confirm password',
                                          border:
                                              OutlineInputBorder(gapPadding: 1),
                                        ),
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              passwordController2.text !=
                                                  passwordController.text) {
                                            return 'Please enter the same password';
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
                                                'Create an account',
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
                                                          "Failed connection")));
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
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
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
                                    ? ElevatedButton(
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
                                        child: Text(
                                          "Log in",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : ElevatedButton(
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
                                        child: Text(
                                          "Create an account",
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
