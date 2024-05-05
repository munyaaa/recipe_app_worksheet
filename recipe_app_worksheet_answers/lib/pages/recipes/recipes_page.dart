import 'package:flutter/material.dart';
import 'package:recipe_app_worksheet/dependency_injection/di.dart';
import 'package:recipe_app_worksheet/pages/recipe_details/recipe_details_page.dart';
import 'package:recipe_app_worksheet/pages/recipes/recipes_view_model.dart';
import 'package:recipe_app_worksheet/pages/recipes/widgets/recipe_item/recipe_item_param.dart';
import 'package:recipe_app_worksheet/pages/recipes/widgets/recipe_item/recipe_item_widget.dart';
import 'package:recipe_app_worksheet/utitlities/page_state.dart';
import 'package:recipe_app_worksheet/widgets/loading/loading_widget.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final RecipesViewModel _viewModel = DI.container.resolve();

  @override
  void initState() {
    super.initState();
    _viewModel.loadCategories();
  }

  @override
  void dispose() {
    _viewModel.categoriesState.close();
    _viewModel.recipesState.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: const Icon(
          Icons.apps_rounded,
        ),
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          StreamBuilder<PageState<List<String>>>(
            stream: _viewModel.categoriesState,
            builder: (context, snapshot) {
              final PageState<List<String>>? state = snapshot.data;
              if (state != null) {
                switch (state.getState()) {
                  case StateType.loading:
                    return const LoadingWidget();
                  case StateType.success:
                    final List<String> categories = state.getData();
                    _viewModel.loadRecipes(categories.first);
                    return DefaultTabController(
                      length: state.getData().length,
                      child: _getTabBar(
                        categories: state.getData(),
                      ),
                    );
                  case StateType.error:
                    return Text('Error: ${state.getError()}');
                }
              }

              return const SizedBox.shrink();
            },
          ),
          StreamBuilder<PageState<List<RecipeItemParam>>>(
              stream: _viewModel.recipesState,
              builder: (context, snapshot) {
                final PageState<List<RecipeItemParam>>? state = snapshot.data;
                if (state != null) {
                  switch (state.getState()) {
                    case StateType.loading:
                      return const Expanded(
                        child: LoadingWidget(),
                      );
                    case StateType.success:
                      return _getRecipeGridWidget(
                        recipes: state.getData(),
                      );
                    case StateType.error:
                      return Text('Error: ${state.getError()}');
                  }
                }
                return const SizedBox.shrink();
              }),
        ],
      ),
    );
  }

  Widget _getTabBar({
    List<String> categories = const [],
  }) {
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicatorColor: const Color(0xFFF85633),
      labelColor: Colors.black,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      onTap: (int value) {
        _viewModel.loadRecipes(categories[value]);
      },
      labelPadding: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      tabs: categories.map((e) => Text(e)).toList(),
    );
  }

  Widget _getRecipeGridWidget({
    List<RecipeItemParam> recipes = const [],
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // TODO 07: change [ListView] to [GridView]
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: recipes
              .map(
                (e) => RecipeItemWidget(
                  param: e,
                  onNavigateToRecipeDetails: (String id) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RecipeDetailsPage(id: id);
                        },
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
