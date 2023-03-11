part of 'information_about_pokemon_bloc.dart';

@immutable
abstract class InformationAboutPokemonScreenState {}

class InformationAboutPokemonScreenInitialState extends InformationAboutPokemonScreenState {}

class InformationAboutPokemonScreenLoadingState extends InformationAboutPokemonScreenState {}

class InformationAboutPokemonScreenSuccessState extends InformationAboutPokemonScreenState {
  final InformationAboutPokemonScreenData data;
  InformationAboutPokemonScreenSuccessState(this.data);
}

class InformationAboutPokemonScreenFailedState extends InformationAboutPokemonScreenState {
  final dynamic error;
  InformationAboutPokemonScreenFailedState(this.error);
}