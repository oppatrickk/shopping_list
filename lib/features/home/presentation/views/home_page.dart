import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/core/enums/shopping_category.dart';
import 'package:shopping_list/core/ui/background.dart';
import 'package:shopping_list/core/ui/custom_divider.dart';
import 'package:shopping_list/core/utils/asset_constants.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';
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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
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
        ],
      ),
    );
  }
}
