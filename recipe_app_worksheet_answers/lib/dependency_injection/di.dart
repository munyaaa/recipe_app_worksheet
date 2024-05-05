import 'package:dio/dio.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
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
    // 1. Run `flutter pub add google_generative_ai`
    // 2. Create your API Key here: [https://aistudio.google.com/app/apikey]
    // 3. Copy the API Key
    // 4. Use dart-define to define the environment before we run the flutter app.
    //    If you run flutter using terminal, run it by `flutter run --dart-define API_KEY=[YOUR_API_KEY]`
    //    If you use VS Code to run, don't forget to edit your launch.json
    //    - Go to Run & Debug
    //    - Look for and click the settings icon, it will open the launch.json
    //    - Add [toolArgs], so the configurations will become like this:
    //    "configurations": [
    //      {
    //        "name": "recipe_app_worksheet",
    //        "request": "launch",
    //        "type": "dart",
    //        "toolArgs": [
    //          "--dart-define",
    //          "API_KEY=[YOUR_API_KEY]"
    //        ]
    //      },
    //      ...
    //    ]
    // 5. Then you can call the api key by `const String.fromEnvironment('API_KEY')`
    container.registerSingleton<GenerativeModel>(
      (container) => GenerativeModel(
        model: 'gemini-pro',
        apiKey: const String.fromEnvironment('API_KEY'),
      ),
    );

    container.registerInstance<RecipeService>(
      RecipeServiceImpl(
        httpClient: container.resolve(),
      ),
    );

    container.registerInstance<AIRecipeService>(
      AIRecipeServiceImpl(
        aiModel: container.resolve(),
      ),
    );

    // since we'll use the view models many times, we should made them factory

    container.registerFactory<RecipesViewModel>(
      (container) => RecipesViewModelImpl(
        service: container.resolve(),
      ),
    );
    container.registerFactory<RecipeDetailsViewModel>(
      (container) => RecipeDetailsViewModelImpl(
        service: container.resolve(),
      ),
    );
    container.registerFactory<AIRecipeViewModel>(
      (container) => AIRecipeViewModeImpl(
        service: container.resolve(),
      ),
    );
  }
}
