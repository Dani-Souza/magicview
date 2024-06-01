part of 'get_favorite_by_user_id_bloc.dart';

abstract class GetFavoriteByUserIdEventBloc extends Equatable {}

class FetchAllFavoriteByUserid extends GetFavoriteByUserIdEventBloc {
  final String userId;

  FetchAllFavoriteByUserid({required this.userId});

  @override
  List<Object?> get props => [];
}
