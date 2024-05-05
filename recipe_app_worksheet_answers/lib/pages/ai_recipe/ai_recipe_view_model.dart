import 'package:recipe_app_worksheet/services/ai_recipe_service.dart';
import 'package:recipe_app_worksheet/utitlities/page_state.dart';
import 'package:recipe_app_worksheet/widgets/recipe/recipe_param.dart';
import 'package:rxdart/subjects.dart';

abstract class AIRecipeViewModel {
  abstract PublishSubject<PageState<RecipeParam>> recipeState;

  Future<void> submitAIRecipe();

  set query(String query);
}

class AIRecipeViewModeImpl implements AIRecipeViewModel {
  String? _query;

  final AIRecipeService service;

  @override
  late PublishSubject<PageState<RecipeParam>> recipeState;

  AIRecipeViewModeImpl({
    required this.service,
  }) {
    recipeState = PublishSubject<PageState<RecipeParam>>();
  }

  @override
  Future<void> submitAIRecipe() async {
    if (_query == null) {
      return;
    }
    // TODO 19: integrate service
    recipeState.add(
      PageState.loading(),
    );

    try {
      final result = await service.generateRecipe(_query ?? '');
      recipeState.add(
        PageState.success(
          RecipeParam(
            name: result.recipeName,
            imageUrl: result.recipeImageUrl,
            ingredients: result.ingredients,
            instructions: result.instructions,
          ),
        ),
      );
    } catch (e) {
      recipeState.add(
        PageState.error('Recipe can\'t be generated'),
      );
    }
  }

  @override
  set query(String query) => _query = query;
}
