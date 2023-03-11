import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../domain/interactor/information_about_pokemon_interactor.dart';
import '../data/information_about_pokemon_screen_data.dart';
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
    '',
  );

  InformationAboutPokemonScreenBloc(
    this.interactor,
    this.viewMapper,
  ) : super(InformationAboutPokemonScreenInitialState()) {
    on<LoadInformationAboutPokemonScreenEvent>((event, emit) async {
      await Future<void>.delayed(Duration(milliseconds: 500));
      screenData.url = event.url;
      final informationAboutPokemonData = viewMapper.toDomainModelData(screenData);
      final data = await interactor.getInformationAboutPokemon(informationAboutPokemonData);

      viewMapper.toScreenData(
        screenData,
        data,

      );
      emit(InformationAboutPokemonScreenSuccessState(screenData));
    });
  }
}
