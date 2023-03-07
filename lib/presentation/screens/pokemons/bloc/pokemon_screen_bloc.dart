import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../domain/interactor/pokemon_interactor.dart';
import '../data/pokemon_screen_data.dart';
import '../pokemons_view_mapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'pokemon_screen_event.dart';
part 'pokemon_screen_state.dart';

class PokemonScreenBloc
    extends Bloc<PokemonScreenEvent, PokemonScreenState> {
  final PokemonInteractor interactor;
  final PokemonViewMapper viewMapper;
  late PokemonScreenData screenData;

  PokemonScreenBloc(
      this.interactor,
      this.viewMapper,
      ) : super(PokemonScreenInitialState()) {
    on<LoadPokemonScreenEvent>((event, emit) async {
      emit(PokemonScreenLoadingState());
      try {
        final data = await interactor.getPokemon();
        screenData = viewMapper.toScreenData(data);

        emit(PokemonScreenSuccessState(screenData));
      } catch (error) {
        emit(PokemonScreenFailedState('sss'));
      }
    });
  }
}
