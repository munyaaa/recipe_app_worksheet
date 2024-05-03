import 'package:flutter/material.dart';
import 'package:recipe_app_worksheet/pages/ai_recipe/ai_recipe_page.dart';
import 'package:recipe_app_worksheet/pages/recipes/recipes_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pageViews = const [
    RecipesPage(),
    AIRecipePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageViews[0],
      bottomNavigationBar: _getNavigationBar(),
    );
  }

  Widget _getNavigationBar() {
    return NavigationBar(
      selectedIndex: 0,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      animationDuration: const Duration(milliseconds: 500),
      indicatorColor: const Color(0xFFF85633),
      onDestinationSelected: (int page) {
        // TODO 02: set page index
      },
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          // TODO 03: set SVG image
          icon: Icon(Icons.sunny),
          label: 'AI Recipe',
        ),
      ],
    );
  }
}
