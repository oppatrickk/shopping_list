import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/core/enums/custom_icon_data.dart';
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

class ShoppingItemSearchDelegate extends SearchDelegate<ShoppingItem?> {
  ShoppingItemSearchDelegate({required this.items});
  final List<ShoppingItem> items;

  @override
  String? get searchFieldLabel => 'Search for a product...';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: CustomIcon(icon: CustomIconData.cancel, color: context.colorScheme.outline),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: CustomIcon(icon: CustomIconData.arrowLeft, color: context.colorScheme.outline),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _filterItems();

    return _buildResultList(results, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = _filterItems();

    return _buildResultList(results, context);
  }

  List<ShoppingItem> _filterItems() {
    if (query.trim().isEmpty) return items;

    final lower = query.toLowerCase();
    return items.where((item) {
      return item.title.toLowerCase().contains(lower) ||
          item.description.toLowerCase().contains(lower) ||
          item.category.toLowerCase().contains(lower);
    }).toList();
  }

  Widget _buildResultList(List<ShoppingItem> results, BuildContext context) {
    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIcon(
              icon: CustomIconData.packageRemove,
              size: 64,
              color: context.colorScheme.outline,
            ),
            verticalSpace(24),
            Text(
              'No items found',
              style: context.textTheme.bodyLarge.medium.cColor(context.colorScheme.outline),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: results.length,
      separatorBuilder: (_, __) => verticalSpace(8),
      itemBuilder: (context, index) {
        final item = results[index];

        return BlocBuilder<HomeShoppingCartCubit, List<ShoppingCart>>(
          builder: (context, cart) {
            return Padding(
              padding: EdgeInsets.only(bottom: index == results.length - 1 ? 64.0 : 0),
              child: ListTile(
                tileColor: context.colorScheme.surfaceContainer,
                contentPadding: const EdgeInsets.only(left: 8, right: 16),
                leading: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item.image,
                        height: 54,
                        width: 54,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (cart.any((e) => e.item.id == item.id && e.quantity > 0))
                      Positioned(
                        top: 0,
                        left: 2,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: context.colorScheme.onSurface,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            cart.firstWhere((e) => e.item.id == item.id).quantity.toString(),
                            style: context.textTheme.labelSmall.bold.cColor(context.colorScheme.onPrimary),
                          ),
                        ),
                      ),
                  ],
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                title: Text(
                  item.title,
                  style: context.textTheme.bodyLarge.medium.cColor(context.colorScheme.onSurface),
                ),
                subtitle: Text(
                  item.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  StringExtension.formatMoney(item.price),
                  style: context.textTheme.titleMedium.semibold.cColor(context.colorScheme.error),
                ),
                onTap: () async {
                  final isAdded = cart.any((e) => e.item.id == item.id && e.quantity > 0);
                  int? initialQuantity;

                  if (isAdded) {
                    initialQuantity = cart.firstWhere((e) => e.item.id == item.id).quantity;
                  }

                  await getIt<SoundService>().playAsset(Assets.click1);
                  if (!context.mounted) return;

                  final result = await showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    builder: (context) => HomeViewItemSheet(
                      item: item,
                      initialQuantity: initialQuantity,
                    ),
                  );

                  if (result) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: context.colorScheme.primaryContainer,
                        content: Row(
                          children: [
                            CustomIcon(icon: CustomIconData.shoppingBasketConfirm, color: context.colorScheme.onPrimaryContainer),
                            horizontalSpace(8),
                            Text(
                              '${item.title} Added / Updated',
                              style: context.textTheme.bodyLarge.cColor(context.colorScheme.onPrimaryContainer),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (!result) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: context.colorScheme.errorContainer,
                        content: Row(
                          children: [
                            CustomIcon(icon: CustomIconData.packageRemove, color: context.colorScheme.onErrorContainer),
                            horizontalSpace(8),
                            Text(
                              '${item.title} Removed',
                              style: context.textTheme.bodyLarge.cColor(context.colorScheme.onErrorContainer),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
