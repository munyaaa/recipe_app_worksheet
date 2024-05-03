import 'package:flutter/material.dart';
import 'package:recipe_app_worksheet/pages/recipes/widgets/recipe_item/recipe_item_param.dart';

class RecipeItemWidget extends StatelessWidget {
  final RecipeItemParam param;

  const RecipeItemWidget({
    super.key,
    required this.param,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO 09: navigate to recipe details
      },
      child: Text(param.name),
      // TODO 08: create recipe item widget
    );
  }
}
