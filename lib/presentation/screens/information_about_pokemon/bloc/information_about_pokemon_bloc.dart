import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../domain/interactor/information_about_pokemon_interactor.dart';
import '../../../../domain/model/information_about_pokemon_data.dart';
import '../data/information_about_pokemon_data.dart';
import '../information_about_pokemon_view_mapper.dart';

part 'information_about_pokemon_event.dart';

part 'information_about_pokemon_state.dart';

class InformationAboutPokemonScreenBloc extends Bloc<InformationAboutPokemonScreenEvent, InformationAboutPokemonScreenState> {
  final InformationAboutPokemonInteractor interactor;
  final InformationAboutPokemonViewMapper viewMapper;
  InformationAboutPokemonScreenData screenData = InformationAboutPokemonScreenData(
    '',
    '',
    0,
    0,
  );

  InformationAboutPokemonScreenBloc(
    this.interactor,
    this.viewMapper,
  ) : super(InformationAboutPokemonScreenInitialState()) {
    on<LoadInformationAboutPokemonScreenEvent>((event, emit) async {
      screenData.url = event.url;
      final pokemonData = viewMapper.toDomainModelData(screenData);
      final data = await interactor.getInformationAboutPokemon(pokemonData);
      viewMapper.toScreenData(
        screenData,

      );
      emit(InformationAboutPokemonScreenSuccessState(data));
    });
  }
}
