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
  }

  @override
  set query(String query) => _query = query;
}
