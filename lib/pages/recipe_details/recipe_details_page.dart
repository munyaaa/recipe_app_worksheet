import 'package:flutter/material.dart';

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
  @override
  void initState() {
    super.initState();
    // TODO 11: call load recipe
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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        // TODO 12: add [StreamBuilder] of recipe details state
        child: Text('Recipe Details'),
      ),
    );
  }
}
