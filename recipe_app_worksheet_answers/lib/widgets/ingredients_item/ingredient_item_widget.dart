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
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(widget.ingredient),
      value: _isChecked,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (value) {
        setState(() {
          _isChecked = value ?? false;
        });
      },
    );
  }
}
