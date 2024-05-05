import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app_worksheet/pages/ai_recipe/ai_recipe_page.dart';
import 'package:recipe_app_worksheet/pages/recipes/recipes_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;

  final List<Widget> _pageViews = const [
    RecipesPage(),
    AIRecipePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageViews[_pageIndex],
      bottomNavigationBar: _getNavigationBar(),
    );
  }

  Widget _getNavigationBar() {
    return NavigationBar(
      selectedIndex: _pageIndex,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      animationDuration: const Duration(milliseconds: 500),
      indicatorColor: const Color(0xFFF85633),
      onDestinationSelected: (int page) {
        // TODO 02: set page index
        setState(() {
          _pageIndex = page;
        });
      },
      destinations: [
        const NavigationDestination(
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
          // 1. Add assets folder on the root.
          // 2. Specify assets folder on pubspec.yaml
          // 3. Call SvgPicture.assets('{assets_path}')
          selectedIcon: SvgPicture.asset(
            'assets/icons/gemini_icon.svg',
            width: 21.0,
            height: 21.0,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
          icon: SvgPicture.asset(
            'assets/icons/gemini_icon.svg',
            width: 21.0,
            height: 21.0,
          ),
          label: 'AI Recipe',
        ),
      ],
    );
  }
}
