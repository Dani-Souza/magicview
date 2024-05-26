part of 'favorite_bloc.dart';

abstract class FavoriteEventBloc extends Equatable {}

class FavoritoImageDefault extends FavoriteEventBloc {
  @override
  List<Object?> get props => [];
}

class FavoriteCreateEvent extends FavoriteEventBloc {
  final String fileName;

  FavoriteCreateEvent({required this.fileName});

  @override
  List<Object?> get props => throw UnimplementedError();
}
