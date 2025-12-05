import 'package:flutter/material.dart';
import 'package:shopping_list/core/utils/extensions.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({
    super.key,
    required this.innerBoxIsScrolled,
  });

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: const SizedBox.shrink(),
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0.0,
      leadingWidth: 0.0,
      toolbarHeight: 54,
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.transparent,
      expandedHeight: 72,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Shopping List',
          style: context.textTheme.headlineSmall.semibold?.copyWith(
            color: context.colorScheme.surface,
            shadows: [Shadow(color: context.colorScheme.onSurface.withAlpha(50), offset: const Offset(0, 2), blurRadius: 4)],
          ),
        ),
        titlePadding: const EdgeInsets.only(bottom: 12.0),
        centerTitle: true,
      ),
      actions: [
        AnimatedOpacity(
          opacity: innerBoxIsScrolled ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
