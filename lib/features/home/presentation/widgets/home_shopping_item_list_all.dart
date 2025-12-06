import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/core/enums/custom_icon_data.dart';
import 'package:shopping_list/core/enums/shopping_category.dart';
import 'package:shopping_list/core/services/sound_service.dart';
import 'package:shopping_list/core/ui/custom_icon.dart';
import 'package:shopping_list/core/utils/asset_constants.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/string_extension.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_cart.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_item.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_cart_cubit.dart';
import 'package:shopping_list/features/home/presentation/views/home_view_item_sheet.dart';
import 'package:shopping_list/injection.dart';

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
          padding: EdgeInsets.only(bottom: sortedCategories.length - 1 == index ? 128.0 : 48.0),
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
                        child: BlocBuilder<HomeShoppingCartCubit, List<ShoppingCart>>(
                          builder: (context, cart) {
                            bool isAdded = cart.any((e) => e.item.id == item.id && e.quantity > 0);
                            int? initialQuantity;

                            if (isAdded) {
                              initialQuantity = cart.firstWhere((e) => e.item.id == item.id).quantity;
                            }

                            return InkWell(
                              onTap: () async {
                                await getIt<SoundService>().playAsset(Assets.click1);
                                if (!context.mounted) return;
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) => HomeViewItemSheet(
                                    item: item,
                                    initialQuantity: initialQuantity,
                                  ),
                                );
                              },
                              child: Container(
                                key: ValueKey(isAdded),
                                width: itemWidth,
                                height: itemHeight,
                                decoration: BoxDecoration(
                                  color: context.colorScheme.surfaceContainer,
                                  borderRadius: BorderRadius.circular(8),
                                  border: isAdded ? Border.all(color: context.colorScheme.tertiary, width: 3) : null,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(isAdded ? 0 : 4.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(isAdded ? 4 : 6),
                                            child: AspectRatio(
                                              aspectRatio: 1,
                                              child: Transform.scale(
                                                scale: 1.05,
                                                child: Image.asset(
                                                  item.image,
                                                  fit: BoxFit.cover,
                                                  filterQuality: FilterQuality.high,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (cart.isNotEmpty && cart.any((e) => e.item.id == item.id)) ...[
                                          Positioned(
                                            top: 4,
                                            left: 4,
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: context.colorScheme.onSurface,
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                              child: Row(
                                                children: [
                                                  CustomIcon(
                                                    icon: CustomIconData.shoppingBasket,
                                                    size: 16,
                                                    height: 16,
                                                    color: context.colorScheme.onPrimary,
                                                  ),
                                                  horizontalSpace(4),
                                                  Text(
                                                    cart.firstWhere((e) => e.item.id == item.id).quantity.toString(),
                                                    style: context.textTheme.labelLarge?.medium?.cColor(context.colorScheme.onPrimary),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: InkWell(
                                              onTap: () async {
                                                if (!context.mounted) return;
                                                await getIt<SoundService>().playAsset(Assets.remove);

                                                if (!context.mounted) return;
                                                context.read<HomeShoppingCartCubit>().removeItem(cart.firstWhere((e) => e.item.id == item.id));
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: context.colorScheme.tertiary,
                                                  borderRadius: const BorderRadius.only(
                                                    topRight: Radius.circular(4),
                                                    bottomLeft: Radius.circular(8),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: CustomIcon(
                                                    icon: CustomIconData.cancel,
                                                    size: 24,
                                                    height: 24,
                                                    color: context.colorScheme.onPrimary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
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
                            );
                          },
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
