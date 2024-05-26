part of 'favorite_bloc.dart';

abstract class FavoriteStateBloc extends Equatable {}

//loading
class FavoriteLoadingState extends FavoriteStateBloc {
  @override
  List<Object?> get props => [];
}

class FavoriteDefaultImageState extends FavoriteStateBloc {
  @override
  List<Object?> get props => [];
}

class FavoriteAddNickAndNumberState extends FavoriteStateBloc {
  @override
  List<Object?> get props => [];
}

// //FavoriteCreate
// class FavoriteCreateImageSate extends FavoriteStateBloc {
//   final String fileName;

//   FavoriteCreateImageSate({required this.fileName});

//   @override
//   List<Object?> get props => [fileName];
// }

// //FavariteSave
// class FavoriteSaveState extends FavoriteStateBloc {
//   final String fileName;
//   FavoriteSaveState({required this.fileName});

//   @override
//   List<Object?> get props => [];
// }

// //favoriteError
// class FavoriteErrorState extends FavoriteStateBloc {
//   final String message;

//   FavoriteErrorState({required this.message});

//   @override
//   List<Object?> get props => [message];
// }
