import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_cart_cubit.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_category_cubit.dart';
import 'package:shopping_list/features/home/presentation/blocs/home_shopping_item_bloc/home_shopping_item_bloc.dart';
import 'package:shopping_list/features/home/presentation/views/home_page.dart';
import 'package:shopping_list/injection.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<HomeShoppingCategoryCubit>()),
        BlocProvider(create: (_) => getIt<HomeShoppingCartCubit>()),
        BlocProvider(create: (_) => getIt<HomeShoppingItemBloc>()..add(const HomeShoppingItemEvent.getAll())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2b6a46)),
          useMaterial3: true,
          brightness: Brightness.light,
          fontFamily: 'Poppins',
        ),
        themeMode: ThemeMode.light,
        home: const HomePage(),
      ),
    );
  }
}
