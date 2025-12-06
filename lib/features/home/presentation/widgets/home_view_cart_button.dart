import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/core/utils/asset_constants.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/string_extension.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_cart.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_cart_cubit.dart';
import 'package:shopping_list/features/home/presentation/views/home_receipt_page.dart';
import 'package:shopping_list/features/home/presentation/views/home_view_cart_sheet.dart';

class ViewCartButton extends StatelessWidget {
  const ViewCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: SafeArea(
        child: BlocBuilder<HomeShoppingCartCubit, List<ShoppingCart>>(
          builder: (context, cart) {
            return Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 32),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () async {
                      final result = await showModalBottomSheet(
                        isScrollControlled: true,
                        useSafeArea: true,
                        context: context,
                        builder: (context) => const HomeViewCartSheet(),
                      );

                      if (result == null && !context.mounted) return;
                      if (result == true) {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeReceipt(cart: cart),
                          ),
                        );
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                      height: 72,
                      width: cart.isNotEmpty ? screenWidthFraction(context, offsetBy: 32) : 72,
                      decoration: BoxDecoration(
                        color: context.colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(64),
                        border: Border.all(
                          color: context.colorScheme.surfaceContainerHighest,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: context.colorScheme.shadow.withAlpha(50),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 0.0,
                          right: cart.isNotEmpty ? 16 : 0.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  height: 58,
                                  width: 58,
                                  decoration: BoxDecoration(
                                    color: context.colorScheme.secondaryContainer,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        color: context.colorScheme.primaryContainer,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          Assets.cart,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (cart.isNotEmpty) horizontalSpace(8),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              switchInCurve: Curves.fastOutSlowIn,
                              switchOutCurve: Curves.fastOutSlowIn,
                              child: cart.isNotEmpty
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'View your Cart',
                                          style: context.textTheme.bodyLarge.bold?.copyWith(color: context.colorScheme.onSurfaceVariant),
                                        ),
                                        Text(
                                          cart.length < 2
                                              ? '${context.read<HomeShoppingCartCubit>().totalItems.toString()} item'
                                              : '${context.read<HomeShoppingCartCubit>().totalItems.toString()} items',
                                          key: ValueKey(cart.length),
                                          style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            const Spacer(),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              switchInCurve: Curves.fastOutSlowIn,
                              switchOutCurve: Curves.fastOutSlowIn,
                              child: cart.isNotEmpty
                                  ? Text(
                                      StringExtension.formatMoney(context.read<HomeShoppingCartCubit>().totalPrice),
                                      key: ValueKey(cart.length),
                                      style: context.textTheme.headlineMedium.bold?.copyWith(color: context.colorScheme.error),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (cart.isEmpty)
                    Positioned(
                      top: 2,
                      right: 2,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: context.colorScheme.error,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.colorScheme.surfaceContainer,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            context.read<HomeShoppingCartCubit>().totalItems.toString(),
                            style: context.textTheme.bodySmall.bold?.copyWith(color: context.colorScheme.surfaceContainer),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
