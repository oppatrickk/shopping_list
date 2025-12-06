import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/core/enums/custom_icon_data.dart';
import 'package:shopping_list/core/ui/custom_icon.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/string_extension.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_cart.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_item.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_cart_cubit.dart';

class HomeShoppingItemListCategorized extends StatelessWidget {
  const HomeShoppingItemListCategorized({
    super.key,
    required this.filteredItems,
  });

  final List<ShoppingItem> filteredItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return TweenAnimationBuilder<double>(
          key: ValueKey(item.id),
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: child,
            );
          },
          child: InkWell(
            onTap: () => context.read<HomeShoppingCartCubit>().addItem(ShoppingCart(item: item, quantity: 1)),
            child: BlocBuilder<HomeShoppingCartCubit, List<ShoppingCart>>(
              builder: (context, cart) {
                final isAdded = cart.any((e) => e.item.id == item.id && e.quantity > 0);
                return Container(
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
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(isAdded ? 5 : 6),
                                color: Colors.white,
                              ),
                              clipBehavior: Clip.antiAlias,
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
                          ],
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.title, style: context.textTheme.labelLarge?.medium),
                            Text(
                              StringExtension.formatMoney(item.price),
                              style: context.textTheme.labelLarge?.medium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
