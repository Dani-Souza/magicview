part of 'get_favorite_bloc.dart';

abstract class GetFavoriteEventBloc extends Equatable {}

class GetFavoriteImageSaveLocal extends GetFavoriteEventBloc {
  @override
  List<Object?> get props => [];
}

class FavoriteDeleteImageEvent extends GetFavoriteEventBloc {
  final int id;
  final String userId;
  final String fileName;

  FavoriteDeleteImageEvent({
    required this.id,
    required this.userId,
    required this.fileName,
  });
  @override
  List<Object?> get props => [id];
}
