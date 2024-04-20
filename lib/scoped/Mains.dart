import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class mainsScoped extends Model {
  List panier = [];
  get getpanier {
    return panier;
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
      print(" j'ai maintenant :" +
          touslesproduits.length.toString() +
          " produits");
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
      print(" j'ai maintenant :" +
          productOfsearch.length.toString() +
          " produits");
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
      print(" produit pour la ca tegorie  :" +
          category +
          productofcategories.length.toString() +
          " produits");
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
      print(" j'ai maintenant :" + panier.length.toString() + " produits");
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
      print(
          " j'ai maintenant :" + allcategories.length.toString() + " produits");
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
}
