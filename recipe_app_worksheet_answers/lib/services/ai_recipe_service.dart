import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:recipe_app_worksheet/models/ai_recipe_model.dart';

abstract class AIRecipeService {
  Future<AIRecipeModel> generateRecipe(String query);
}

class AIRecipeServiceImpl implements AIRecipeService {
  final GenerativeModel aiModel;

  AIRecipeServiceImpl({required this.aiModel});

  @override
  Future<AIRecipeModel> generateRecipe(String query) async {
    // TODO 18: integrate generate recipe from [GenerativeModel]
    // Tips: To make Gemini generate a truly JSON, use the specific command
    final content = await aiModel.generateContent(
      [
        Content.text('''Generate me a $query recipe with this JSON structure:
            ${jsonEncode(AIRecipeModel.toJsonSample())}'''),
      ],
    );

    return AIRecipeModel.fromJson(
      jsonDecode(
        content.text ?? '',
      ),
    );
  }
}
