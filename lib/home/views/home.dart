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

class _ResponsiveHomeScreenState extends State<ResponsiveHomeScreen> with TickerProviderStateMixin {
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
      child: Scaffold(
        backgroundColor: lightColor,
        appBar: const HomeAppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HomeLoaded) {
              return HomeScreen(homeDataModel: state.homeDataModel,);
            }
            if(state is FavoriteLoaded){
              return FavoritesScreen(favorites: favorites,);
            }
            if(state is CartLoaded){
              return CartScreen(cart: cart,);
            }
            if(state is ProfileLoaded){
              return const ProfileScreen();
            }
            if (state is HomeError) {
              return Center(
                child: Text(state.error.errorMsg ?? "Something went wrong"),
              );
            }
            return const Center(
              child: Text("ERROR: UNKNOWN"),
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return MyBottomNavigationBar(
              tabController: tabController,
              onTap: (index) {
                if(state is! HomeInitial){
                  pageIndex = tabController.index;
                  if(pageIndex == 0){
                    BlocProvider.of<HomeBloc>(context).add(LoadProducts());
                  }
                  if(pageIndex == 1){
                    BlocProvider.of<HomeBloc>(context).add(LoadFavorites());
                  }
                  if(pageIndex == 2){
                    BlocProvider.of<HomeBloc>(context).add(LoadCart());
                  }
                  if(pageIndex == 3){
                    BlocProvider.of<HomeBloc>(context).add(LoadProfile());
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }
}
