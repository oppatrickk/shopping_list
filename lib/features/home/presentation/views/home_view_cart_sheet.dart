import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/core/enums/custom_icon_data.dart';
import 'package:shopping_list/core/services/sound_service.dart';
import 'package:shopping_list/core/ui/custom_icon.dart';
import 'package:shopping_list/core/ui/custom_scrollbar.dart';
import 'package:shopping_list/core/utils/asset_constants.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/string_extension.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_cart.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_cart_cubit.dart';
import 'package:shopping_list/features/home/presentation/widgets/home_remove_shopping_item_dialog.dart';
import 'package:shopping_list/features/home/presentation/widgets/home_start_over_dialog.dart';
import 'package:shopping_list/injection.dart';

class HomeViewCartSheet extends StatelessWidget {
  const HomeViewCartSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return SafeArea(
      left: false,
      right: false,
      child: BlocBuilder<HomeShoppingCartCubit, List<ShoppingCart>>(
        builder: (context, cart) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 6,
                  decoration: BoxDecoration(
                    color: context.colorScheme.outline,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                if (cart.isEmpty)
                  Container(
                    width: screenWidth(context),
                  ),
                verticalSpace(16),
                cart.isEmpty
                    ? Text(
                        'My Cart',
                        style: context.textTheme.displaySmall.bold?.copyWith(
                          color: context.colorScheme.onSurface,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'My Cart',
                              style: context.textTheme.displaySmall.bold?.copyWith(
                                color: context.colorScheme.onSurface,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: context.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Row(
                                children: [
                                  CustomIcon(
                                    icon: CustomIconData.shoppingBasket,
                                    color: context.colorScheme.onPrimary,
                                  ),
                                  horizontalSpace(8),
                                  Text(
                                    cart.length < 2
                                        ? '${context.read<HomeShoppingCartCubit>().totalItems.toString()} item'
                                        : '${context.read<HomeShoppingCartCubit>().totalItems.toString()} items',
                                    style: context.textTheme.bodyLarge.semibold?.cColor(context.colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                verticalSpace(16),

                if (cart.isNotEmpty)
                  Flexible(
                    child: CustomScrollbar(
                      controller: scrollController,
                      color: context.colorScheme.outline,
                      thumbVisibility: true,
                      thickness: 8,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: cart.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.colorScheme.surfaceContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 72,
                                  width: 72,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      cart[index].item.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                horizontalSpace(16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      cart[index].item.title,
                                      style: context.textTheme.bodyLarge.semibold,
                                    ),
                                    verticalSpace(4),
                                    Text(
                                      StringExtension.formatMoney(cart[index].item.price),
                                      style: context.textTheme.bodyMedium.medium?.copyWith(
                                        color: context.colorScheme.inverseSurface,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: context.colorScheme.surface,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: context.colorScheme.outline, width: 0.5),
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await getIt<SoundService>().playAsset(Assets.click2);
                                          if (!context.mounted) return;
                                          if (cart[index].quantity > 1) {
                                            context.read<HomeShoppingCartCubit>().updateItem(
                                              ShoppingCart(item: cart[index].item, quantity: cart[index].quantity - 1),
                                            );
                                          } else {
                                            bool result = await showDialog(
                                              context: context,
                                              builder: (_) => HomeRemoveShoppingItemDialog(itemTitle: cart[index].item.title),
                                            );

                                            if (!context.mounted) return;

                                            if (result) context.read<HomeShoppingCartCubit>().removeItem(cart[index]);
                                          }
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                            cart[index].quantity.toString(),
                                            style: context.textTheme.titleMedium.cColor(context.colorScheme.text),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await getIt<SoundService>().playAsset(Assets.click2);
                                          if (!context.mounted) return;
                                          if (cart[index].quantity < 100) {
                                            context.read<HomeShoppingCartCubit>().updateItem(
                                              ShoppingCart(item: cart[index].item, quantity: cart[index].quantity + 1),
                                            );
                                          }
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                horizontalSpace(16),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  SizedBox(
                    height: screenHeightFraction(context, dividedBy: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomIcon(
                          icon: CustomIconData.shoppingBasket,
                          size: 96,
                          height: 96,
                          color: context.colorScheme.outline,
                        ),
                        verticalSpace(8),
                        Text(
                          'Your cart is currently empty.',
                          style: context.textTheme.titleMedium.normal?.copyWith(
                            color: context.colorScheme.outline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                verticalSpace(16),
                if (cart.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          height: 1,
                          width: screenWidth(context),
                          decoration: BoxDecoration(color: context.colorScheme.outlineVariant),
                        ),
                        verticalSpace(16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Total: ',
                              style: context.textTheme.titleLarge.bold?.copyWith(
                                color: context.colorScheme.onSurface,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              StringExtension.formatMoney(context.read<HomeShoppingCartCubit>().totalPrice),
                              style: context.textTheme.headlineLarge.bold?.copyWith(
                                color: context.colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
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
                        TextButton(
                          onPressed: () async {
                            bool result = await showDialog(
                              context: context,
                              builder: (_) => const HomeStartOverDialog(),
                            );

                            if (!context.mounted) return;

                            if (result) {
                              if (!context.mounted) return;
                              await getIt<SoundService>().playAsset(Assets.remove);

                              if (!context.mounted) return;
                              context.read<HomeShoppingCartCubit>().clearAllItem();
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'Start Over',
                            style: context.textTheme.bodyMedium.cColor(context.colorScheme.error),
                          ),
                        ),
                        FilledButton(
                          onPressed: () async {
                            if (!context.mounted) return;
                            await getIt<SoundService>().playAsset(Assets.cashRegister);
                            await Future.delayed(const Duration(milliseconds: 500), () {});

                            if (!context.mounted) return;

                            Navigator.pop(context, true);
                          },
                          child: Row(
                            children: [
                              CustomIcon(
                                icon: CustomIconData.shoppingBasketConfirm,
                                size: 24,
                                height: 24,
                                color: context.colorScheme.onPrimary,
                              ),
                              horizontalSpace(8),
                              Text(
                                'Complete Shopping List',
                                style: context.textTheme.bodyMedium.cColor(context.colorScheme.onPrimary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
