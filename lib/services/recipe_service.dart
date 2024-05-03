import 'package:dio/dio.dart';
import 'package:recipe_app_worksheet/models/categories_model.dart';
import 'package:recipe_app_worksheet/models/recipe_details_model.dart';
import 'package:recipe_app_worksheet/models/recipes_model.dart';

abstract class RecipeService {
  Future<CategoriesModel> getCategories();
  Future<RecipesModel> getRecipes(String category);
  Future<RecipeDetailsModel> getRecipeDetails(String id);
}

class RecipeServiceImpl implements RecipeService {
  final Dio httpClient;

  RecipeServiceImpl({
    required this.httpClient,
  });

  @override
  Future<CategoriesModel> getCategories() async {
    // TODO 05: call API to get categories
    throw UnimplementedError();
  }

  @override
  Future<RecipesModel> getRecipes(String category) async {
    final response = await httpClient.get(
      '/filter.php?c=$category',
    );
    return RecipesModel.fromJson(
      response.data,
    );
  }

  @override
  Future<RecipeDetailsModel> getRecipeDetails(String id) async {
    final response = await httpClient.get(
      '/lookup.php?i=$id',
    );
    return RecipeDetailsModel.fromJson(
      List.from(response.data['meals']).first,
    );
  }
}
