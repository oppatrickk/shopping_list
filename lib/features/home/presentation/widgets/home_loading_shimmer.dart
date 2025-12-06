import 'package:flutter/material.dart';
import 'package:shopping_list/core/ui/shimmer_loading.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';

class HomeLoadingShimmerAll extends StatelessWidget {
  const HomeLoadingShimmerAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShimmerLoading(),
        verticalSpace(16),
        ShimmerLoading(
          height: screenHeightFraction(context, dividedBy: 5),
          borderRadius: 8,
        ),
        verticalSpace(16),
        const ShimmerLoading(),
        verticalSpace(16),
        ShimmerLoading(
          height: screenHeightFraction(context, dividedBy: 5),
          borderRadius: 8,
        ),
      ],
    );
  }
}

class HomeLoadingShimmerCategorized extends StatelessWidget {
  const HomeLoadingShimmerCategorized({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              ShimmerLoading(
                height: screenHeightFraction(context, dividedBy: 5),
                width: screenWidthFraction(context, dividedBy: 2, offsetBy: 48),
                borderRadius: 8,
              ),
              horizontalSpace(16),
              ShimmerLoading(
                height: screenHeightFraction(context, dividedBy: 5),
                width: screenWidthFraction(context, dividedBy: 2, offsetBy: 48),
                borderRadius: 8,
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              ShimmerLoading(
                height: screenHeightFraction(context, dividedBy: 5),
                width: screenWidthFraction(context, dividedBy: 2, offsetBy: 48),
                borderRadius: 8,
              ),
              horizontalSpace(16),
              ShimmerLoading(
                height: screenHeightFraction(context, dividedBy: 5),
                width: screenWidthFraction(context, dividedBy: 2, offsetBy: 48),
                borderRadius: 8,
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              ShimmerLoading(
                height: screenHeightFraction(context, dividedBy: 5),
                width: screenWidthFraction(context, dividedBy: 2, offsetBy: 48),
                borderRadius: 8,
              ),
              horizontalSpace(16),
              ShimmerLoading(
                height: screenHeightFraction(context, dividedBy: 5),
                width: screenWidthFraction(context, dividedBy: 2, offsetBy: 48),
                borderRadius: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
