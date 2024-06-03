part of 'get_favorite_bloc.dart';

abstract class GetFavoriteStateBloc extends Equatable {}

class GetFavoriteLoandingStateLocalSavedBloc extends GetFavoriteStateBloc {
  @override
  List<Object?> get props => [];
}

class GetFavoriteLoandedStateLocalSavedBloc extends GetFavoriteStateBloc {
  final List<FavoriteMovie> favoriteMovie;
  GetFavoriteLoandedStateLocalSavedBloc(this.favoriteMovie);
  @override
  List<Object?> get props => [favoriteMovie];
}
