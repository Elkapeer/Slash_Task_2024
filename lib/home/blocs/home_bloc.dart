import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slash_task/home/models/home_data_model.dart';
import 'package:slash_task/core/services/api_status.dart';
import '../../core/models/product_model.dart';
import '../repositories/home_repo.dart';
import '../../core/globals.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitial(location: currLocation)) {

    on<LoadProducts>((event, emit) async {
      emit(HomeInitial(location: currLocation));
      var res = await homeRepository.getHomeData();
      if(res is HomeDataModel) {
        emit(HomeLoaded(homeDataModel: res,location: currLocation));
      }else{
        emit(HomeError(error: res,location: currLocation));
      }
    });

    on<LoadFavorites>((event, emit) {
      emit(FavoriteLoaded(favorites: favorites, location: currLocation));
    });

    on<LoadCart>((event, emit) {
      emit(CartLoaded(cart: cart, location: currLocation));
    });

    on<LoadProfile>((event, emit) {
      emit(ProfileLoaded(location: currLocation));
    });

    on<AddToCart>((event, emit) {
      cart.add(event.product);
      emit(state);
    });

    on<AddToFavorite>((event, emit) {
      favorites.add(event.product);
      emit(state);
    });

    on<RemoveCart>((event, emit) {
      cart.removeWhere((element) => element.name == event.product.name);
      emit(state);
    });

    on<RemoveFavorite>((event, emit) {
      favorites.removeWhere((element) => element.name == event.product.name);
      emit(state);
    });

    on<UpdateLocation>((event, emit) {
      currLocation = event.location;
      final state = this.state;
      if(state is HomeLoaded){
        emit(state.copyWith(
          location: currLocation
        ));
      }
      if(state is FavoriteLoaded){
        emit(state.copyWith(
            location: currLocation
        ));
      }
      if(state is CartLoaded){
        emit(state.copyWith(
            location: currLocation
        ));
      }
      if(state is ProfileLoaded){
        emit(state.copyWith(
            location: currLocation
        ));
      }
    });

  }
}
