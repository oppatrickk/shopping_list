import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shopping_list/core/enums/custom_icon_data.dart';
import 'package:shopping_list/core/ui/background.dart';
import 'package:shopping_list/core/ui/custom_divider.dart';
import 'package:shopping_list/core/ui/custom_icon.dart';
import 'package:shopping_list/core/ui/custom_scrollbar.dart';
import 'package:shopping_list/core/ui/receipt_clipper.dart';
import 'package:shopping_list/core/utils/asset_constants.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/string_extension.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_cart.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_cart_cubit.dart';

class HomeReceipt extends StatelessWidget {
  const HomeReceipt({
    super.key,
    required this.cart,
  });

  final List<ShoppingCart> cart;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            const Background(image: Assets.homeBackground2),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: ClipPath(
                  clipper: ReceiptClipper(),
                  child: Container(
                    width: screenWidthFraction(context, offsetBy: 64),
                    height: screenHeightFraction(context, offsetBy: 64),
                    decoration: BoxDecoration(color: context.colorScheme.surface),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                              color: context.colorScheme.primaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomIcon(
                                icon: CustomIconData.shoppingBasketConfirm,
                                size: 48,
                                height: 48,
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(4),
                        Center(
                          child: Text(
                            'Your Shopping List',
                            style: context.textTheme.headlineSmall.bold.cColor(context.colorScheme.onSurface),
                          ),
                        ),
                        const CustomDivider(padding: EdgeInsets.symmetric(vertical: 16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Invoice Number',
                              style: context.textTheme.bodyMedium.semibold.cColor(context.colorScheme.onSurface),
                            ),
                            Text(
                              DateTime.now().millisecondsSinceEpoch.toString(),
                              style: context.textTheme.bodyMedium.normal.cColor(context.colorScheme.onSurface),
                            ),
                          ],
                        ),
                        verticalSpace(4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date',
                              style: context.textTheme.bodyMedium.semibold.cColor(context.colorScheme.onSurface),
                            ),
                            Text(
                              DateFormat.yMd('en_US').format(DateTime.now()),
                              style: context.textTheme.bodyMedium.normal.cColor(context.colorScheme.onSurface),
                            ),
                          ],
                        ),

                        const CustomDivider(padding: EdgeInsets.symmetric(vertical: 16)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '#',
                                  style: context.textTheme.bodyMedium.semibold.cColor(context.colorScheme.onSurface),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Item',
                                  style: context.textTheme.bodyMedium.semibold.cColor(context.colorScheme.onSurface),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Qty',
                                  style: context.textTheme.bodyMedium.semibold.cColor(context.colorScheme.onSurface),

                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Price',
                                  style: context.textTheme.bodyMedium.semibold.cColor(context.colorScheme.onSurface),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(8),

                        Expanded(
                          child: CustomScrollbar(
                            color: context.colorScheme.outline,
                            thumbVisibility: true,
                            thickness: 2,
                            child: ListView.builder(
                              itemCount: cart.length,
                              itemBuilder: (context, index) {
                                final cartItem = cart[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(flex: 1, child: Text('${index + 1}')),
                                      Expanded(flex: 3, child: Text(cartItem.item.title)),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          cartItem.quantity.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          '\$${cartItem.item.price.toStringAsFixed(2)}',
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const CustomDivider(padding: EdgeInsets.symmetric(vertical: 16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: context.textTheme.headlineSmall.bold.cColor(context.colorScheme.onSurface),
                            ),
                            Text(
                              StringExtension.formatMoney(context.read<HomeShoppingCartCubit>().totalPrice),
                              style: context.textTheme.headlineSmall.bold.cColor(context.colorScheme.error),
                            ),
                          ],
                        ),
                        verticalSpace(32),
                        FilledButton(
                          style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0)),
                          onPressed: () async {
                            context.read<HomeShoppingCartCubit>().clearAllItem();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Return to Home',
                            style: context.textTheme.headlineSmall.medium.cColor(context.colorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
