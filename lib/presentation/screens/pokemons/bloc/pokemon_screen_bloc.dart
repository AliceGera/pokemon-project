import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../../domain/interactor/pokemon_interactor.dart';
import '../data/pokemon_screen_data.dart';
import '../pokemon_view_mapper.dart';
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
    on<LoadMorePokemonsScreenEvent>(
      (event, emit) async {
        try {
          if (event.isFirstLoading) {
            emit(PokemonScreenLoadingState());
            final pokemonData = viewMapper.toDomainModelData(screenData);
            final data = await interactor.getPokemon(pokemonData);
            viewMapper.toScreenData(
              data,
              screenData,
              event.isFirstLoading,
            );
            emit(PokemonScreenSuccessState(screenData));
          } else if (!screenData.isLoadMore && screenData.isHasNext) {
            screenData.isLoadMore = true;
            emit(PokemonScreenSuccessState(screenData));
            try {
              final pokemonData = viewMapper.toDomainModelData(screenData);
              final data = await interactor.getPokemon(pokemonData);
              viewMapper.toScreenData(
                data,
                screenData,
                event.isFirstLoading,
              );
              screenData.isLoadMore = false;
              emit(PokemonScreenSuccessState(screenData));
            } catch (error) {
              screenData.isLoadMore = false;
              emit(PokemonScreenFailedState(error));
            }
          }
        } catch (error) {
          emit(PokemonScreenFailedState(error));
        }
      },
    );
  }
}
