part of 'get_my_favorite_bloc.dart';

abstract class GetMyFavoriteStateBloc extends Equatable {}

class GetMyFavoriteStateLoadindBloc extends GetMyFavoriteStateBloc {
  @override
  List<Object?> get props => [];
}

class GetMyFavoriteStateLoadedBloc extends GetMyFavoriteStateBloc {
  final List<Favorite> favorite;

  GetMyFavoriteStateLoadedBloc({required this.favorite});
  @override
  List<Object?> get props => [];
}

class GetMyFavoriteStateErrorBloc extends GetMyFavoriteStateBloc {
  final String message;

  GetMyFavoriteStateErrorBloc({required this.message});

  @override
  List<Object?> get props => [];
}
