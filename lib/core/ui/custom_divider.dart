import 'package:flutter/material.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.color,
    this.padding,
  });

  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Container(
        height: 1,
        width: screenWidth(context),
        decoration: BoxDecoration(color: color ?? context.colorScheme.outlineVariant),
      ),
    );
  }
}
