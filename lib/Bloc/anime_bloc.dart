import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/ModelClass/Anime.dart';
import '../Repository/api/anime_api.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  late AnimeModel anime;
  AnimeApi animeApi =AnimeApi();
  AnimeBloc() : super(AnimeInitial()) {
    on<AnimeEvent>((event, emit) async{
      emit (AnimeBlocLoading());
      try{
        anime =await animeApi.getAnime();
        emit(AnimeBlocLoaded());
      }
          catch(a){
        emit(AnimeBlocError());
          }
    });
  }
}
