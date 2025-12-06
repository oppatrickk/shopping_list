import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_item.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_item_bloc/home_shopping_item_bloc.dart';
import 'package:shopping_list/features/home/presentation/views/home_search_item_delegate.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      leading: const SizedBox.shrink(),
      automaticallyImplyLeading: false,
      centerTitle: false,
      elevation: 0.0,
      leadingWidth: 0.0,
      toolbarHeight: 48,
      titleSpacing: 0,
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: BlocBuilder<HomeShoppingItemBloc, HomeShoppingItemState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                onTap: () async {
                  await state.maybeMap(
                    loaded: (state) async {
                      await showSearch<ShoppingItem?>(
                        context: context,
                        delegate: ShoppingItemSearchDelegate(items: state.items),
                      );
                    },
                    orElse: () => null,
                  );
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSurface.withAlpha(164),
                    borderRadius: BorderRadius.circular(64),
                    border: Border.all(
                      color: context.colorScheme.surface,
                      width: 0.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Search for a product...',
                          style: context.textTheme.bodyMedium.normal?.copyWith(
                            color: context.colorScheme.surface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        centerTitle: true,
      ),
    );
  }
}
