import 'package:recipe_app_worksheet/pages/recipes/widgets/recipe_item/recipe_item_param.dart';
import 'package:recipe_app_worksheet/services/recipe_service.dart';
import 'package:recipe_app_worksheet/utitlities/page_state.dart';
import 'package:rxdart/subjects.dart';

abstract class RecipesViewModel {
  abstract BehaviorSubject<PageState<List<String>>> categoriesState;
  abstract BehaviorSubject<PageState<List<RecipeItemParam>>> recipesState;

  Future<void> loadCategories();
  Future<void> loadRecipes(String category);
}

class RecipesViewModelImpl implements RecipesViewModel {
  @override
  late BehaviorSubject<PageState<List<String>>> categoriesState;

  @override
  late BehaviorSubject<PageState<List<RecipeItemParam>>> recipesState;

  final RecipeService service;

  RecipesViewModelImpl({
    required this.service,
  }) {
    categoriesState = BehaviorSubject<PageState<List<String>>>.seeded(
      PageState.loading(),
    );
    recipesState = BehaviorSubject<PageState<List<RecipeItemParam>>>.seeded(
      PageState.loading(),
    );
  }

  @override
  Future<void> loadCategories() async {
    try {
      categoriesState.add(
        PageState.loading(),
      );
      // TODO 06: uncomment these codes

      // final result = await service.getCategories();

      // categoriesState.add(
      //   PageState.success(
      //     result.categories.map((e) => e.strCategory).toList(),
      //   ),
      // );
    } catch (e) {
      categoriesState.add(
        PageState.error(
          e.toString(),
        ),
      );
      recipesState.add(
        PageState.error(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> loadRecipes(String category) async {
    try {
      recipesState.add(
        PageState.loading(),
      );

      final result = await service.getRecipes(category);

      recipesState.add(
        PageState.success(
          result.meals
              .map(
                (e) => RecipeItemParam(
                  id: e.idMeal,
                  name: e.strMeal,
                  imageUrl: e.strMealThumb,
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      recipesState.add(
        PageState.error(
          e.toString(),
        ),
      );
    }
  }
}
