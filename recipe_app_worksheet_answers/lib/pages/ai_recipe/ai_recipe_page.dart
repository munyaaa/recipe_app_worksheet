import 'package:flutter/material.dart';
import 'package:recipe_app_worksheet/dependency_injection/di.dart';
import 'package:recipe_app_worksheet/pages/ai_recipe/ai_recipe_view_model.dart';
import 'package:recipe_app_worksheet/utitlities/page_state.dart';
import 'package:recipe_app_worksheet/widgets/loading/loading_widget.dart';
import 'package:recipe_app_worksheet/widgets/recipe/recipe_param.dart';
import 'package:recipe_app_worksheet/widgets/recipe/recipe_widget.dart';

class AIRecipePage extends StatefulWidget {
  const AIRecipePage({super.key});

  @override
  State<AIRecipePage> createState() => _AIRecipePageState();
}

class _AIRecipePageState extends State<AIRecipePage> {
  final AIRecipeViewModel _viewModel = DI.container.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('AI Recipe'),
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getSearchBar(),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Powered by:'),
                  Container(
                    height: 20.0,
                    margin: const EdgeInsets.only(left: 6.0, bottom: 4.0),
                    child: Image.asset(
                      'assets/images/gemini.png',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              StreamBuilder<PageState<RecipeParam>>(
                stream: _viewModel.recipeState,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  if (state != null) {
                    switch (state.getState()) {
                      case StateType.loading:
                        return const LoadingWidget();
                      case StateType.success:
                        final param = state.getData();
                        return RecipeDetailsWidget(
                          param: param,
                        );
                      case StateType.error:
                        return Text('Error: ${state.getError()}');
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              hintText: 'Recipe to search...',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              isCollapsed: true,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
            ),
            onChanged: (value) {
              // TODO 20: set query
              _viewModel.query = value;
            },
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        Material(
          color: const Color(0xFFF85633),
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 18.0,
              ),
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
            onTap: () {
              _viewModel.submitAIRecipe();
            },
          ),
        ),
      ],
    );
  }
}
