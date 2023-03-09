import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../../domain/interactor/pokemon_interactor.dart';
import '../data/pokemon_screen_data.dart';
import '../pokemons_view_mapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pokemon_screen_event.dart';

part 'pokemon_screen_state.dart';

class PokemonScreenBloc extends Bloc<PokemonScreenEvent, PokemonScreenState> {
  final PokemonInteractor interactor;
  final PokemonViewMapper viewMapper;

  PokemonScreenData screenData = PokemonScreenData([], 0);
  PokemonScreenBloc(
    this.interactor,
    this.viewMapper,
  ) : super(PokemonScreenInitialState()) {
    on<LoadMorePokemonsScreenEvent>((event, emit) async {
      try {
        if (event.isFirstLoading) {
          emit(PokemonScreenLoadingState());
          final data = await interactor.getPokemon(screenData.offset, screenData.limit);
          viewMapper.toScreenData(
            data,
            screenData,
            event.isFirstLoading,
          );
          emit(PokemonScreenSuccessState(screenData));
        } else if (screenData.isLoadMore && screenData.isHasNext) {
          try {
            emit(PokemonScreenSuccessState(screenData));
          } catch (error) {
            emit(PokemonScreenFailedState(error));
          }
        }
        emit(PokemonScreenSuccessState(screenData));
      } catch (error) {
        emit(PokemonScreenFailedState(error));
      }
    });
  }
}
