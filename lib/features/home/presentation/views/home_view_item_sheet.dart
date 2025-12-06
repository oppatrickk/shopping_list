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

class HomeViewItemSheet extends StatefulWidget {
  const HomeViewItemSheet({
    super.key,
    required this.item,
    this.initialQuantity,
  });

  final ShoppingItem item;
  final int? initialQuantity;

  @override
  State<HomeViewItemSheet> createState() => _HomeViewItemSheetState();
}

class _HomeViewItemSheetState extends State<HomeViewItemSheet> {
  late int quantity;

  @override
  void initState() {
    setState(() {
      if (widget.initialQuantity != null) {
        quantity = widget.initialQuantity!;
      } else {
        quantity = 1;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: AspectRatio(
                  aspectRatio: 1.8,
                  child: Transform.scale(
                    scale: 1.05,
                    child: Image.asset(
                      widget.item.image,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: 48,
                    height: 6,
                    decoration: BoxDecoration(
                      color: context.colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainerHighest,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CustomIcon(
                        icon: CustomIconData.cancel,
                        size: 24,
                        height: 24,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.item.title,
                      style: context.textTheme.headlineMedium.semibold?.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      StringExtension.formatMoney(widget.item.price),
                      style: context.textTheme.displaySmall.bold?.copyWith(
                        color: context.colorScheme.error,
                      ),
                    ),
                  ],
                ),
                verticalSpace(24),
                Text(
                  widget.item.description,
                  style: context.textTheme.bodyLarge.normal?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                verticalSpace(128),
              ],
            ),
          ),
          verticalSpace(24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            width: screenWidth(context),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.onSurface.withAlpha(25),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: context.colorScheme.outline, width: 0.5),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (quantity > 0) setState(() => quantity--);
                        },
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CustomIcon(
                              icon: CustomIconData.remove,
                              size: 24,
                              height: 24,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 32,
                        decoration: BoxDecoration(
                          color: context.colorScheme.surface,
                        ),
                        child: Center(
                          child: Text(
                            quantity.toString(),
                            style: context.textTheme.titleLarge.cColor(context.colorScheme.text),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (quantity < 100) setState(() => quantity++);
                        },
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CustomIcon(
                              icon: CustomIconData.add,
                              size: 24,
                              height: 24,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: quantity == 0 && widget.initialQuantity != null ? context.colorScheme.error : context.colorScheme.primary,
                  ),
                  onPressed: () {
                    if (quantity == 0) {
                      if (widget.initialQuantity != null) {
                        context.read<HomeShoppingCartCubit>().removeItem(ShoppingCart(item: widget.item, quantity: widget.initialQuantity!));
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    } else {
                      if (quantity > 0) {
                        if (widget.initialQuantity != null) {
                          context.read<HomeShoppingCartCubit>().updateItem(ShoppingCart(item: widget.item, quantity: quantity));
                        } else {
                          context.read<HomeShoppingCartCubit>().addItem(ShoppingCart(item: widget.item, quantity: quantity));
                        }
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Row(
                    children: [
                      CustomIcon(
                        icon: quantity == 0 && widget.initialQuantity != null ? CustomIconData.packageRemove : CustomIconData.packageDelivered,
                        size: 24,
                        height: 24,
                        color: context.colorScheme.onPrimary,
                      ),
                      horizontalSpace(8),
                      Text(
                        quantity == 0 && widget.initialQuantity != null
                            ? 'Remove'
                            : widget.initialQuantity != null
                            ? 'Update Cart'
                            : 'Add to Cart',
                        style: context.textTheme.bodyLarge.cColor(context.colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
