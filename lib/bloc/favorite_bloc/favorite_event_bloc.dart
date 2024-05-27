part of 'favorite_bloc.dart';

abstract class FavoriteEventBloc extends Equatable {}

// class FavoritoImageDefault extends FavoriteEventBloc {
//   @override
//   List<Object?> get props => [];
// }

class FavoriteCreateEvent extends FavoriteEventBloc {
  final String fileName;
  final ScreenArguments screenArguments;
  final GlobalKey genKey;

  FavoriteCreateEvent(
      {required this.screenArguments,
      required this.fileName,
      required this.genKey});

  @override
  List<Object?> get props => [fileName, screenArguments, genKey];
}

class FavoriteShowImageSaved extends FavoriteEventBloc {
  final int id;

  FavoriteShowImageSaved({required this.id});
  @override
  List<Object?> get props => [id];
}
