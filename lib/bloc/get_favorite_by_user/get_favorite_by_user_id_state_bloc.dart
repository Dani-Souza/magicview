part of 'get_favorite_by_user_id_bloc.dart';

abstract class GetFavoriteByUserIdStateBloc extends Equatable {}

class GetFavoriteByIdUserLoadingState extends GetFavoriteByUserIdStateBloc {
  @override
  List<Object?> get props => [];
}

class GetFavoriteByIdUserLoadadeState extends GetFavoriteByUserIdStateBloc {
  final List<Favorite> favoriteList;

  GetFavoriteByIdUserLoadadeState({required this.favoriteList});

  @override
  List<Object?> get props => [favoriteList];
}

class GetFavoriteByIdUserErroState extends GetFavoriteByUserIdStateBloc {
  final String message;

  GetFavoriteByIdUserErroState({required this.message});

  @override
  List<Object?> get props => [message];
}
