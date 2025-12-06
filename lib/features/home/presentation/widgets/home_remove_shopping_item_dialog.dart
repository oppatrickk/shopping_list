import 'package:flutter/material.dart';
import 'package:shopping_list/core/enums/custom_icon_data.dart';
import 'package:shopping_list/core/ui/custom_icon.dart';
import 'package:shopping_list/core/utils/extensions.dart';
import 'package:shopping_list/core/utils/ui_helpers.dart';

class HomeRemoveShoppingItemDialog extends StatelessWidget {
  const HomeRemoveShoppingItemDialog({
    super.key,
    required this.itemTitle,
  });

  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CustomIcon(
                  icon: CustomIconData.packageRemove,
                  color: context.colorScheme.error,
                  size: 32,
                ),
                horizontalSpace(16),
                Text(
                  'Remove Item',
                  style: context.textTheme.headlineMedium.semibold.cColor(context.colorScheme.error),
                ),
              ],
            ),
            verticalSpace(16),
            Text(
              'Are you sure you want to remove $itemTitle from your cart?',
              style: context.textTheme.bodyLarge.cColor(context.colorScheme.onSurface),
            ),

            verticalSpace(48),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text(
                      'Cancel',
                      style: context.textTheme.bodyLarge.cColor(context.colorScheme.outline),
                    ),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                ),
                Expanded(
                  child: FilledButton(
                    child: const Text('Remove'),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
