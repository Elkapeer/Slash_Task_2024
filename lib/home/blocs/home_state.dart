part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  final String location;

  const HomeInitial({required this.location,});

  @override
  List<Object> get props => [location];
}


final class HomeLoaded extends HomeState {
  final HomeDataModel homeDataModel;
  final String location;

  const HomeLoaded({required this.homeDataModel, required this.location});

  @override
  List<Object> get props => [homeDataModel, location];

  HomeLoaded copyWith({
    HomeDataModel? homeDataModel,
    String? location,
  }) {
    return HomeLoaded(
      homeDataModel: homeDataModel ?? this.homeDataModel,
      location: location ?? this.location,
    );
  }
}


final class FavoriteLoaded extends HomeState {
  final List<Product> favorites;
  final String location;

  const FavoriteLoaded({required this.favorites, required this.location});

  @override
  List<Object> get props => [favorites, location];

  FavoriteLoaded copyWith({
    List<Product>? favorites,
    String? location,
  }) {
    return FavoriteLoaded(
      favorites: favorites ?? this.favorites,
      location: location ?? this.location,
    );
  }
}


final class CartLoaded extends HomeState {
  final List<Product> cart;
  final String location;

  const CartLoaded({required this.cart, required this.location});

  @override
  List<Object> get props => [cart, location];

  CartLoaded copyWith({
    List<Product>? cart,
    String? location,
  }) {
    return CartLoaded(
      cart: cart ?? this.cart,
      location: location ?? this.location,
    );
  }
}


final class ProfileLoaded extends HomeState {
  final String location;

  const ProfileLoaded({required this.location});

  @override
  List<Object> get props => [location];

  ProfileLoaded copyWith({
    String? location,
  }) {
    return ProfileLoaded(
      location: location ?? this.location,
    );
  }
}


final class HomeError extends HomeState {
  final Fail error;
  final String location;

  const HomeError({required this.error, required this.location,});

  @override
  List<Object> get props => [error, location];
}
