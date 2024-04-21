import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class mainsScoped extends Model {
  List panier = [];
  get getpanier {
    return panier;
  }

  get getsolde {
    double somme = 0;
    panier.forEach((element) {
      somme = somme + (element["quantity"] * element["price"]);
    });
    return somme;
  }

  addproductpanier(data) {
    if (panier
            .where(
                (element) => element["id"].toString() == data["id"].toString())
            .toList()
            .length <
        1) {
      data["quantity"] = 1;
      panier.add(data);
    } else {
      panier
          .where((element) => element["id"].toString() == data["id"].toString())
          .toList()[0]["quantity"] = int.parse(panier
              .where((element) =>
                  element["id"].toString() == data["id"].toString())
              .toList()[0]["quantity"]
              .toString()) +
          1;
    }

    notifyListeners();
  }

  reduceproductpanier(data) {
    if (data["quantity"] == 2) {
      data["quantity"] = 1;
      panier
          .where((element) => element["id"].toString() == data["id"].toString())
          .toList()[0]["quantity"] = 1;
    } else {
      panier
          .where((element) => element["id"].toString() == data["id"].toString())
          .toList()[0]["quantity"] = int.parse(panier
              .where((element) =>
                  element["id"].toString() == data["id"].toString())
              .toList()[0]["quantity"]
              .toString()) -
          1;
    }

    notifyListeners();
  }

  removeproductpanier(id) {
    panier.removeWhere((element) => element["id"].toString() == id.toString());
    notifyListeners();
  }

  List touslesproduits = [];
  get getAllproduct {
    return touslesproduits;
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      Map dataList = Map.from(jsonDecode(response.body));

      touslesproduits = dataList["products"];
      notifyListeners();
    } else {
      notifyListeners();
      throw Exception('Erreur de chargement des données');
    }
    notifyListeners();
  }

  List productofcategories = [];
  get getproductofcategories {
    return productofcategories;
  }

  List productOfsearch = [];
  get getproductOfsearch {
    return productOfsearch;
  }

  Future<void> fetchProductsOfSearch(String key) async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products/search?q=' + key));

    if (response.statusCode == 200) {
      Map dataList = Map.from(jsonDecode(response.body));

      productOfsearch = dataList["products"];
      notifyListeners();
    } else {
      notifyListeners();
      throw Exception('Erreur de chargement des données');
    }
    notifyListeners();
  }

  Future<void> fetchProductsOfCategory(String category) async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products/category/' + category));

    if (response.statusCode == 200) {
      Map dataList = Map.from(jsonDecode(response.body));

      productofcategories = dataList["products"];
      notifyListeners();
    } else {
      notifyListeners();
      throw Exception('Erreur de chargement des données');
    }
    notifyListeners();
  }

  List allcategories = [];
  get getallcategories {
    return allcategories;
  }

  Future<bool> addProduct() async {
    try {
      // Définition de l'URL de l'API et des données à envoyer
      final url = Uri.parse('https://dummyjson.com/carts/add');
      final body = jsonEncode({
        'userId': user["id"],
        'products': [
          {
            'id': 1,
            'quantity': 1,
          },
          {
            'id': 50,
            'quantity': 2,
          },
        ],
      });

      // Définition des en-têtes de la requête
      final headers = {'Content-Type': 'application/json'};

      // Envoi de la requête HTTP POST
      final response = await http.post(url, headers: headers, body: body);

      // Vérification de la réponse
      if (response.statusCode == 200) {
        // Si la réponse est réussie, imprimez les données JSON reçues
        print(jsonDecode(response.body));
        return true;
      } else {
        // Si la réponse a échoué, imprimez le code d'erreur
        print('Erreur: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Gestion des erreurs
      print('Erreur: $e');
      return false;
    }
  }

  Future<void> fetchpanier() async {
    final response = await http.get(
        Uri.parse('https://dummyjson.com/carts/user/' + user["id"].toString()));

    if (response.statusCode == 200) {
      Map dataList = jsonDecode(response.body);

      panier = dataList["carts"][0]['products'];
      notifyListeners();
    } else {
      notifyListeners();
      throw Exception('Erreur de chargement des données');
    }
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));

    if (response.statusCode == 200) {
      List dataList = List.from(jsonDecode(response.body));

      allcategories = dataList;
      notifyListeners();
    } else {
      notifyListeners();
      throw Exception('Erreur de chargement des données');
    }
    notifyListeners();
  }

  Map user = {};
  setuser(String data) {
    user = jsonDecode(data);
    notifyListeners();
  }

  get getuser {
    return user;
  }

  Future loginUser(String username, String password) async {
    // Définition de l'URL de l'API et des données à envoyer
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final body = jsonEncode({
      'username': username,
      'password': password,
    });

    // Définition des en-têtes de la requête
    final headers = {'Content-Type': 'application/json'};

    // Envoi de la requête HTTP POST
    final response = await http.post(url, headers: headers, body: body);

    // Vérification de la réponse
    if (response.statusCode == 200) {
      // Si la réponse est réussie, imprimez les données JSON reçues
      print(jsonDecode(response.body));
      user = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("user", response.body).toString();
      notifyListeners();
      return true;
    } else {
      // Si la réponse a échoué, imprimez le code d'erreur
      print('Erreur: ${response.body}');
      return false;
    }
  }

  Future<void> modifyCart() async {
    try {
      // Définition de l'URL de l'API et des données à envoyer
      final url = Uri.parse('https://dummyjson.com/carts/add');
      final body = jsonEncode({
        'userId': 1,
        'products': [
          {
            'id': 1,
            'quantity': 1,
          },
          {
            'id': 50,
            'quantity': 2,
          },
        ],
      });

      // Définition des en-têtes de la requête
      final headers = {'Content-Type': 'application/json'};

      // Envoi de la requête HTTP POST
      final response = await http.post(url, headers: headers, body: body);

      // Vérification de la réponse
      if (response.statusCode == 200) {
        // Si la réponse est réussie, imprimez les données JSON reçues
        print(jsonDecode(response.body));
      } else {
        // Si la réponse a échoué, imprimez le code d'erreur
        print('Erreur: ${response.statusCode}');
      }
    } catch (e) {
      // Gestion des erreurs
      print('Erreur: $e');
    }
  }

  Future<bool> CreateUser(String username, String password) async {
    try {
      // Définition de l'URL de l'API et des données à envoyer
      final url = Uri.parse('https://dummyjson.com/users/add');
      final body = jsonEncode({
        'username': username,
        'lastName': username,
        'firstname': username,
        "password": password,
        'image':
            "data:image/png;base64,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"

        /* autres données de l'utilisateur */
      });

      // Définition des en-têtes de la requête
      final headers = {'Content-Type': 'application/json'};

      // Envoi de la requête HTTP POST
      final response = await http.post(url, headers: headers, body: body);

      // Vérification de la réponse
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', response.body.toString());
        user = jsonDecode(response.body);
        // Si la réponse est réussie, imprimez les données JSON reçues
        return true;
      } else {
        // Si la réponse a échoué, imprimez le code d'erreur
        print('Erreur: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Gestion des erreurs
      print('Erreur: $e');
      return false;
    }
  }

  Future<void> deleteCart() async {
    try {
      // Définition de l'URL de l'API
      final url = Uri.parse('https://dummyjson.com/carts/1');

      // Envoi de la requête HTTP DELETE
      final response = await http.delete(url);

      // Vérification de la réponse
      if (response.statusCode == 200) {
        // Si la réponse est réussie, imprimez les données JSON reçues
        print(response.body);
      } else {
        // Si la réponse a échoué, imprimez le code d'erreur
        print('Erreur: ${response.statusCode}');
      }
    } catch (e) {
      // Gestion des erreurs
      print('Erreur: $e');
    }
  }
}
