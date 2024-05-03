import 'package:recipe_app_worksheet/models/ai_recipe_model.dart';

abstract class AIRecipeService {
  Future<AIRecipeModel> generateRecipe(String query);
}

class AIRecipeServiceImpl implements AIRecipeService {
  @override
  Future<AIRecipeModel> generateRecipe(String query) async {
    // TODO 18: integrate generate recipe from [GenerativeModel]
    throw UnimplementedError();
  }
}
