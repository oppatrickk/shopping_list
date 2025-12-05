import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/core/enums/shopping_category.dart';
import 'package:shopping_list/core/ui/background.dart';
import 'package:shopping_list/core/ui/custom_divider.dart';
import 'package:shopping_list/core/utils/asset_constants.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_category_cubit.dart';
import 'package:shopping_list/features/home/presentation/widgets/home_search_bar.dart';
import 'package:shopping_list/features/home/presentation/widgets/home_shopping_category_button.dart';
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
                HomeSliverAppBar(innerBoxIsScrolled: innerBoxIsScrolled),
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
                            child: ListView(
                              children: [
                                Text(category?.title ?? 'All'),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.5),
                                const Text('lol'),
                                SizedBox(height: MediaQuery.of(context).size.height),
                                const Text('lol'),
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
          ),
        ],
      ),
    );
  }
}
