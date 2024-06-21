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

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(HomeInitial());
      var res = await homeRepository.getHomeData();
      if(res is HomeDataModel) {
        emit(HomeLoaded(res));
      }else{
        emit(HomeError(res));
      }
    });
    on<LoadFavorites>((event, emit) {
      emit(FavoriteLoaded(favorites: favorites));
    });
    on<LoadCart>((event, emit) {
      emit(CartLoaded(cart: cart));
    });
    on<LoadProfile>((event, emit) {
      emit(ProfileLoaded());
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
      print(currLocation);
      emit(state);
    });
  }
}
