import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/core/enums/shopping_category.dart';
import 'package:shopping_list/core/ui/background.dart';
import 'package:shopping_list/core/ui/custom_divider.dart';
import 'package:shopping_list/core/utils/asset_constants.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/string_extension.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_cart.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_cart_cubit.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_category_cubit.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_item_bloc/home_shopping_item_bloc.dart';
import 'package:shopping_list/features/home/presentation/widgets/home_loading_shimmer.dart';
import 'package:shopping_list/features/home/presentation/widgets/home_search_bar.dart';
import 'package:shopping_list/features/home/presentation/widgets/home_shopping_category_button.dart';
import 'package:shopping_list/features/home/presentation/widgets/home_shopping_item_list_all.dart';
import 'package:shopping_list/features/home/presentation/widgets/home_shopping_item_list_categorized.dart';
import 'package:shopping_list/features/home/presentation/widgets/home_sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const Background(image: Assets.homeBackground1),

          SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                HomeSliverAppBar(
                  key: ValueKey(innerBoxIsScrolled),
                  innerBoxIsScrolled: innerBoxIsScrolled,
                ),
                const HomeSearchBar(),
              ],
              body: BlocBuilder<HomeShoppingCategoryCubit, ShoppingCategory?>(
                builder: (context, category) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 54.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: screenWidth(context),
                            height: 110,
                            child: ListView.separated(
                              padding: const EdgeInsets.only(top: 16),
                              separatorBuilder: (context, index) => horizontalSpace(0),
                              scrollDirection: Axis.horizontal,
                              itemCount: ShoppingCategory.values.length,
                              itemBuilder: (context, index) {
                                if (index == ShoppingCategory.values.length - 1) {
                                  return const SizedBox.shrink();
                                }

                                return HomeShoppingCategoryButton(
                                  onTap: () => context.read<HomeShoppingCategoryCubit>().setActiveCategory(ShoppingCategory.values[index]),
                                  index: index,
                                  active: category == ShoppingCategory.values[index],
                                );
                              },
                            ),
                          ),
                          const CustomDivider(),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: BlocBuilder<HomeShoppingItemBloc, HomeShoppingItemState>(
                                builder: (context, state) {
                                  return state.maybeMap(
                                    initial: (_) => const SizedBox.shrink(),
                                    loading: (_) {
                                      if (category == ShoppingCategory.all) {
                                        return const HomeLoadingShimmerAll();
                                      } else {
                                        return const HomeLoadingShimmerCategorized();
                                      }
                                    },
                                    loaded: (HomeShoppingItemLoaded state) {
                                      final filteredItems = category == ShoppingCategory.all
                                          ? state.items
                                          : state.items.where((item) => item.categoryEnum == category).toList();

                                      if (category == ShoppingCategory.all) {
                                        return HomeShoppingItemListAll(items: state.items);
                                      } else {
                                        return HomeShoppingItemListCategorized(filteredItems: filteredItems);
                                      }
                                    },
                                    error: (_) => Center(
                                      child: Text(
                                        'An error has occured. Please try again later.',
                                        style: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.error),
                                      ),
                                    ),
                                    orElse: () => const SizedBox.shrink(),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Positioned(
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: BlocBuilder<HomeShoppingCartCubit, List<ShoppingCart?>>(
                builder: (context, cart) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 32),
                    child: Stack(
                      children: [
                        AnimatedContainer(
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
                                              cart.length < 2 ? '${cart.length} item' : '${cart.length} items',
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
                                  '${cart.length}',
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
          ),
        ],
      ),
    );
  }
}
