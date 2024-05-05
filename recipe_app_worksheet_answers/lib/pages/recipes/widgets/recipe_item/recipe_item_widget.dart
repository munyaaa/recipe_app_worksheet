import 'package:flutter/material.dart';
import 'package:recipe_app_worksheet/pages/recipes/widgets/recipe_item/recipe_item_param.dart';

class RecipeItemWidget extends StatelessWidget {
  final RecipeItemParam param;
  final void Function(String id)? onNavigateToRecipeDetails;

  const RecipeItemWidget({
    super.key,
    required this.param,
    this.onNavigateToRecipeDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO 09: navigate to recipe details
        // Add function onNavigateToRecipeDetails, so the navigator will be handled on the page.
        // Don't forget to check the [onNavigateToRecipeDetails] that called on [RecipesPage] (TODO 07)
        onNavigateToRecipeDetails?.call(param.id);
      },
      // TODO 08: create recipe item widget
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  param.imageUrl,
                  height: 40.0,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                param.name,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
