import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:modernshop/pages/LoginPage.dart";
import "package:modernshop/scoped/Mains.dart";
import "package:scoped_model/scoped_model.dart";
import "package:shared_preferences/shared_preferences.dart";

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image(image: AssetImage("assets/images/logo.png")),
          ),
          centerTitle: true,
          title: Text(
            "User",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: ScopedModelDescendant<mainsScoped>(
          builder: (context, child, model) {
            return Container(
              margin: EdgeInsets.all(
                MediaQuery.of(context).size.height / 100,
              ),
              child: ListView(
                children: [
                  Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.height / 4,
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              model.getuser["image"].toString()),
                        )),
                  ),
                  Center(
                    child: Text(
                      model.getuser["email"].toString(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height / 40),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(
                      MediaQuery.of(context).size.height / 100,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.height / 80))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Username"),
                          subtitle: Text(
                            model.getuser["username"].toString(),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.mail,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Email"),
                          subtitle: Text(model.getuser["email"].toString()),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(
                      MediaQuery.of(context).size.height / 100,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.height / 80))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person_outline_sharp,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Firstname"),
                          subtitle: Text(model.getuser["firstName"].toString()),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person_outline_sharp,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Lastname"),
                          subtitle: Text(model.getuser["lastName"].toString()),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(
                      MediaQuery.of(context).size.height / 100,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.height / 80))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Log Out"),
                                  content:
                                      Text("Are you sure you want to log out?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                    TextButton(
                                        onPressed: () async {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.clear();
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return LoginPage();
                                            },
                                          ));
                                        },
                                        child: Text(
                                          "Log out",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                );
                              },
                            );
                          },
                          leading: Icon(
                            Icons.exit_to_app,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text("Log Out"),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      "ModernShop",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height / 50),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
