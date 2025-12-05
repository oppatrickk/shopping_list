import 'package:flutter/material.dart';
import 'package:shopping_list/core/utils/asset_constants.dart';
import 'package:shopping_list/core/utils/extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage(Assets.homeBackground1),
              fit: BoxFit.fill,
            ),
          ),

          SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
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
                  ),
                  SliverAppBar(
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
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      centerTitle: true,
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.only(top: 54.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      const Text('lol'),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.5),
                      const Text('lol'),
                      SizedBox(height: MediaQuery.of(context).size.height),
                      const Text('lol'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
