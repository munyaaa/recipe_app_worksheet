import 'package:flutter/material.dart';
import 'package:recipe_app_worksheet/dependency_injection/di.dart';
import 'package:recipe_app_worksheet/pages/recipe_details/recipe_details_view_model.dart';
import 'package:recipe_app_worksheet/utitlities/page_state.dart';
import 'package:recipe_app_worksheet/widgets/recipe/recipe_param.dart';
import 'package:recipe_app_worksheet/widgets/recipe/recipe_widget.dart';

class RecipeDetailsPage extends StatefulWidget {
  final String id;

  const RecipeDetailsPage({
    super.key,
    required this.id,
  });

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  final RecipeDetailsViewModel _viewModel = DI.container.resolve();

  @override
  void initState() {
    super.initState();
    // TODO 11: call load recipe
    _viewModel.loadRecipeDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // TODO 12: add [StreamBuilder] of recipe details state
        // Since we use the stream ([BehaviorSubject]), so we must use the [StreamBuilder]
        child: StreamBuilder<PageState<RecipeParam>>(
          stream: _viewModel.recipeDetailsState,
          builder: (context, snapshot) {
            final state = snapshot.data;
            if (state != null) {
              switch (state.getState()) {
                case StateType.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case StateType.error:
                  return Text(state.getError());
                case StateType.success:
                  return SingleChildScrollView(
                    child: RecipeDetailsWidget(
                      param: state.getData(),
                    ),
                  );
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
