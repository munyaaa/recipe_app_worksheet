import 'package:flutter/material.dart';
import 'package:recipe_app_worksheet/widgets/ingredients_item/ingredient_item_widget.dart';
import 'package:recipe_app_worksheet/widgets/recipe/recipe_param.dart';

class RecipeDetailsWidget extends StatelessWidget {
  final RecipeParam param;

  const RecipeDetailsWidget({
    super.key,
    required this.param,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          param.name,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Container(
          height: 94.0,
          width: 94.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(1.0, 1.0),
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              param.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // TODO 15: add error placeholder image
                return Text('error: ${error.toString()}');
              },
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        // TODO 13: call _getIngredientsWidget
        const SizedBox(
          height: 16.0,
        ),
        // TODO 14: call _getInstructionsWidget
      ],
    );
  }

  List<Widget> _getIngredientsWidgets() {
    return [
      const Text(
        'Ingredients',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      Column(
        children: param.ingredients
            .map(
              (e) => IngredientItemWidget(
                ingredient: e,
              ),
            )
            .toList(),
      ),
    ];
  }

  List<Widget> _getInstructionsWidget() {
    return [
      const Text(
        'Instructions',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      Column(
        children: param.instructions
            .map(
              (e) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(e),
              ),
            )
            .toList(),
      ),
    ];
  }
}
