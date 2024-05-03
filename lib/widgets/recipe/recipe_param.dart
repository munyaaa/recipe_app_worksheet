class RecipeParam {
  final String name;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> instructions;

  RecipeParam({
    required this.name,
    required this.imageUrl,
    this.ingredients = const [],
    this.instructions = const [],
  });
}
