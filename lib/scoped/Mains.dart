import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

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
}
