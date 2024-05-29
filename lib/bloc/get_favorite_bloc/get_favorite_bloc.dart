import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/entities/favorite_movie.dart';

part 'get_favorite_event_bloc.dart';
part 'get_favorite_state_bloc.dart';

class GetFavoriteBloc
    extends Bloc<GetFavoriteEventBloc, GetFavoriteStateBloc> {}
