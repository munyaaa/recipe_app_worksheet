import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:recipe_app_worksheet/pages/ai_recipe/ai_recipe_view_model.dart';
import 'package:recipe_app_worksheet/pages/recipe_details/recipe_details_view_model.dart';
import 'package:recipe_app_worksheet/pages/recipes/recipes_view_model.dart';
import 'package:recipe_app_worksheet/services/ai_recipe_service.dart';
import 'package:recipe_app_worksheet/services/recipe_service.dart';

class DI {
  static final KiwiContainer container = KiwiContainer();

  static void register() {
    container.registerSingleton<Dio>(
      (container) => Dio(
        BaseOptions(
          baseUrl: 'https://www.themealdb.com/api/json/v1/1',
        ),
      ),
    );
    // TODO 17: register [GenerativeModel]

    container.registerInstance<RecipeService>(
      RecipeServiceImpl(
        httpClient: container.resolve(),
      ),
    );

    container.registerInstance<AIRecipeService>(
      AIRecipeServiceImpl(),
    );

    container.registerInstance<RecipesViewModel>(
      RecipesViewModelImpl(
        service: container.resolve(),
      ),
    );
    container.registerInstance<RecipeDetailsViewModel>(
      RecipeDetailsViewModelImpl(),
    );
    container.registerInstance<AIRecipeViewModel>(
      AIRecipeViewModeImpl(
        service: container.resolve(),
      ),
    );
  }
}
