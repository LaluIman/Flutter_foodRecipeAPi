import 'dart:convert';
import 'package:flutter_recipeapi/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "a32def8a52mshf9327af6262f2c2p1ace08jsn068832a086c7",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List<Map<String, dynamic>> recipes = [];

    for (var i in data['feed']) {
      recipes.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(recipes);
  }
}