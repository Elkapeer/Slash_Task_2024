part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadProducts extends HomeEvent {

  @override
  List<Object> get props => [];
}

class AddToFavorite extends HomeEvent {
  final Product product;
  const AddToFavorite(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFavorite extends HomeEvent {
  final Product product;
  const RemoveFavorite(this.product);

  @override
  List<Object> get props => [product];
}

class AddToCart extends HomeEvent {
  final Product product;
  const AddToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveCart extends HomeEvent {
  final Product product;
  const RemoveCart(this.product);

  @override
  List<Object> get props => [product];
}

class UpdateLocation extends HomeEvent {
  final String location;
  const UpdateLocation(this.location);

  @override
  List<Object> get props => [location];
}

class LoadFavorites extends HomeEvent {

  @override
  List<Object> get props => [];
}

class LoadCart extends HomeEvent {

  @override
  List<Object> get props => [];
}

class LoadProfile extends HomeEvent {

  @override
  List<Object> get props => [];
}