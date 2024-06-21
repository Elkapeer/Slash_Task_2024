import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/constants.dart';
import 'package:slash_task/core/globals.dart';
import 'package:slash_task/home/repositories/home_repo.dart';
import 'package:slash_task/home/views/components/app_bar.dart';
import 'package:slash_task/home/views/components/bottom_nav_bar.dart';
import 'package:slash_task/home/views/components/screens/cart_screen.dart';
import 'package:slash_task/home/views/components/screens/favorite_screen.dart';
import 'package:slash_task/home/views/components/screens/home-screen.dart';
import 'package:slash_task/home/views/components/screens/profile_screen.dart';
import '../blocs/home_bloc.dart';

class ResponsiveHomeScreen extends StatefulWidget {
  const ResponsiveHomeScreen({super.key});

  @override
  State<ResponsiveHomeScreen> createState() => _ResponsiveHomeScreenState();
}

class _ResponsiveHomeScreenState extends State<ResponsiveHomeScreen>
    with TickerProviderStateMixin {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: 4, vsync: this);

    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) =>
          HomeBloc(
              RepositoryProvider.of<HomeRepository>(context)
          )
            ..add(LoadProducts()),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: lightColor,

            appBar: HomeAppBar(),
            // one screen is shown with different ui
            // and data according to current state
            body: state is HomeInitial?
              const Center(child: CircularProgressIndicator()) :
              state is HomeLoaded?
              HomeScreen(homeDataModel: state.homeDataModel,) :
              state is FavoriteLoaded?
              FavoritesScreen(favorites: favorites,) :
              state is CartLoaded?
              CartScreen(cart: cart) :
              state is ProfileLoaded?
              const ProfileScreen() :
              state is HomeError?
              Center(child: Text(state.error.errorMsg ?? "Something went wrong")) :
              const Center(child: Text("ERROR: UNKNOWN"),),

            bottomNavigationBar: MyBottomNavigationBar(
              tabController: tabController,
              onTap: (index) {
                if (state is! HomeInitial) {
                  pageIndex = tabController.index;
                  if (pageIndex == 0) {
                    BlocProvider.of<HomeBloc>(context).add(LoadProducts());
                  }
                  if (pageIndex == 1) {
                    BlocProvider.of<HomeBloc>(context).add(LoadFavorites());
                  }
                  if (pageIndex == 2) {
                    BlocProvider.of<HomeBloc>(context).add(LoadCart());
                  }
                  if (pageIndex == 3) {
                    BlocProvider.of<HomeBloc>(context).add(LoadProfile());
                  }
                } else {
                  pageIndex = 0;
                  tabController.animateTo(0);
                }
              },
            )
          );
        },
      ),
    );
  }
}
