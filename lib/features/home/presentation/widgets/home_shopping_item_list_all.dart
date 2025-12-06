import 'package:flutter/material.dart';
import 'package:shopping_list/core/enums/shopping_category.dart';
import 'package:shopping_list/core/ui/custom_icon.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/string_extension.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_item.dart';

class HomeShoppingItemListAll extends StatelessWidget {
  const HomeShoppingItemListAll({
    super.key,
    required this.items,
  });

  final List<ShoppingItem> items;
  @override
  Widget build(BuildContext context) {
    final Map<String, List<ShoppingItem>> categorizedItems = {};
    for (var item in items) {
      categorizedItems.putIfAbsent(item.category, () => []).add(item);
    }

    final sortedCategories = categorizedItems.keys.toList()
      ..sort((a, b) {
        final aEnum = ShoppingCategory.values.firstWhere(
          (e) => e.name == a,
          orElse: () => ShoppingCategory.others,
        );
        final bEnum = ShoppingCategory.values.firstWhere(
          (e) => e.name == b,
          orElse: () => ShoppingCategory.others,
        );
        return aEnum.order.compareTo(bEnum.order);
      });

    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / 2.5;
    final itemHeight = itemWidth / 0.85;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sortedCategories.length,
      itemBuilder: (context, index) {
        final categoryKey = sortedCategories[index];
        final categoryEnum = ShoppingCategory.values.firstWhere(
          (e) => e.name == categoryKey,
          orElse: () => ShoppingCategory.others,
        );
        final categoryTitle = categoryEnum.title;
        final categoryIcon = categoryEnum.icon;
        final categoryItems = categorizedItems[categoryKey]!;

        return Padding(
          padding: const EdgeInsets.only(bottom: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomIcon(
                    icon: categoryIcon,
                    size: 24,
                    height: 24,
                    color: context.colorScheme.onSurface,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    categoryTitle,
                    style: context.textTheme.titleMedium.bold.cColor(context.colorScheme.onSurface),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: itemHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryItems.length,
                  itemBuilder: (context, itemIndex) {
                    final item = categoryItems[itemIndex];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: TweenAnimationBuilder<double>(
                        key: ValueKey(item.id),
                        tween: Tween(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 300),
                        builder: (context, value, child) {
                          return Opacity(opacity: value, child: child);
                        },
                        child: Container(
                          width: itemWidth,
                          height: itemHeight,
                          decoration: BoxDecoration(
                            color: context.colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.asset(
                                      item.image,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.title,
                                        style: context.textTheme.labelLarge?.medium,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      StringExtension.formatMoney(item.price),
                                      style: context.textTheme.labelLarge?.medium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
