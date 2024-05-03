import 'package:flutter/material.dart';

class IngredientItemWidget extends StatefulWidget {
  final String ingredient;

  const IngredientItemWidget({
    super.key,
    required this.ingredient,
  });

  @override
  State<IngredientItemWidget> createState() => _IngredientItemWidgetState();
}

class _IngredientItemWidgetState extends State<IngredientItemWidget> {
  // TODO 16: add checked ability
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(widget.ingredient),
      value: false,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (value) {},
    );
  }
}
