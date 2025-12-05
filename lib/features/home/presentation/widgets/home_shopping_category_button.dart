import 'package:flutter/widgets.dart';
import 'package:shopping_list/core/enums/shopping_category.dart';
import 'package:shopping_list/core/ui/custom_icon.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';

class HomeShoppingCategoryButton extends StatelessWidget {
  const HomeShoppingCategoryButton({
    super.key,
    required this.index,
    required this.active,
    required this.onTap,
  });

  final int index;
  final bool active;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minWidth: 80),
        width: 64,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIcon(
                icon: ShoppingCategory.values[index].activeIcon,
                size: 48,
                height: 48,
                color: active ? context.colorScheme.error : context.colorScheme.onSurfaceVariant,
              ),
              verticalSpace(8),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  ShoppingCategory.values[index].title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: active ? context.colorScheme.error : context.colorScheme.onSurfaceVariant,
                    fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
