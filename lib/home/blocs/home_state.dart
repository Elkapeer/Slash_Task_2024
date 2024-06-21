part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoaded extends HomeState{
  final HomeDataModel homeDataModel;
  const HomeLoaded(this.homeDataModel);

  @override
  List<Object> get props => [homeDataModel];
}

final class FavoriteLoaded extends HomeState{
  // it is a static state for now
  final List<Product> favorites;
  const FavoriteLoaded({required this.favorites});
  @override
  List<Object> get props => [favorites];
}

final class CartLoaded extends HomeState{
  // it is a static state for now
  final List<Product> cart;
  const CartLoaded({required this.cart});
  @override
  List<Object> get props => [cart];
}

final class ProfileLoaded extends HomeState{
  // it is a static state for now
  @override
  List<Object> get props => [];
}

final class HomeError extends HomeState{
  final Fail error;
  const HomeError(this.error);

  @override
  List<Object> get props => [error];
}