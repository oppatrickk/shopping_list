import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    this.baseColor,
    this.highlightColor,
    this.width,
    this.height,
    this.borderRadius,
  });

  final Color? baseColor;
  final Color? highlightColor;

  final double? width;
  final double? height;

  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? context.colorScheme.surfaceContainer,
      highlightColor: highlightColor ?? context.colorScheme.surface,
      child: Container(
        width: width ?? screenWidth(context),
        height: height ?? 32,
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(borderRadius ?? 32),
        ),
      ),
    );
  }
}
