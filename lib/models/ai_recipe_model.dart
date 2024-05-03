class AIRecipeModel {
  final String recipeName;
  final String recipeImageUrl;
  final List<String> ingredients;
  final List<String> instructions;

  AIRecipeModel({
    required this.recipeName,
    required this.recipeImageUrl,
    required this.ingredients,
    required this.instructions,
  });

  factory AIRecipeModel.fromJson(Map<String, dynamic> json) {
    return AIRecipeModel(
      recipeName: json['recipe_name'],
      recipeImageUrl: json['recipe_image_url'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
    );
  }

  static Map<String, dynamic> toJsonSample() {
    return {
      'recipe_name': 'string',
      'recipe_image_url': 'string',
      'ingredients': ['string'],
      'instructions': ['string'],
    };
  }
}
