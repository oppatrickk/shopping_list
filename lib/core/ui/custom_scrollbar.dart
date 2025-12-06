import 'package:flutter/material.dart';
import 'package:shopping_list/core/utils/extensions.dart';

class CustomScrollbar extends StatelessWidget {
  const CustomScrollbar({
    super.key,
    this.controller,
    required this.child,
    this.thickness,
    this.thumbVisibility,
    this.color,
    this.radius,
  });

  final ScrollController? controller;
  final Widget child;
  final double? thickness;
  final bool? thumbVisibility;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RawScrollbar(
        controller: controller,
        thickness: thickness ?? 8,
        radius: Radius.circular(radius ?? 32),
        thumbColor: color ?? context.colorScheme.secondaryContainer,
        thumbVisibility: thumbVisibility ?? false,
        child: child,
      ),
    );
  }
}
