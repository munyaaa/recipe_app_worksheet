import 'package:recipe_app_worksheet/services/recipe_service.dart';
import 'package:recipe_app_worksheet/utitlities/page_state.dart';
import 'package:recipe_app_worksheet/widgets/recipe/recipe_param.dart';
import 'package:rxdart/subjects.dart';

abstract class RecipeDetailsViewModel {
  // TODO 10: add recipe details state and state
  abstract BehaviorSubject<PageState<RecipeParam>> recipeDetailsState;

  Future<void> loadRecipeDetails(String id);
}

class RecipeDetailsViewModelImpl implements RecipeDetailsViewModel {
  @override
  late BehaviorSubject<PageState<RecipeParam>> recipeDetailsState;

  final RecipeService service;

  RecipeDetailsViewModelImpl({
    required this.service,
  }) {
    recipeDetailsState = BehaviorSubject<PageState<RecipeParam>>.seeded(
      PageState.loading(),
    );
  }

  @override
  Future<void> loadRecipeDetails(String id) async {
    recipeDetailsState.add(
      PageState.loading(),
    );

    try {
      final result = await service.getRecipeDetails(id);
      recipeDetailsState.add(
        PageState.success(
          RecipeParam(
            name: result.strMeal,
            imageUrl: result.strMealThumb,
            ingredients: result.ingredients,
            instructions: result.instructions,
          ),
        ),
      );
    } catch (e) {
      recipeDetailsState.add(
        PageState.error(e.toString()),
      );
    }
  }
}
