part of 'pokemon_screen_bloc.dart';

@immutable
abstract class PokemonScreenState {}

class PokemonScreenInitialState extends PokemonScreenState {}

class PokemonScreenLoadingState extends PokemonScreenState {}

class PokemonScreenSuccessState extends PokemonScreenState {
  final PokemonScreenData data;
  PokemonScreenSuccessState(this.data);
}

class PokemonScreenFailedState extends PokemonScreenState {
  final dynamic error;
  PokemonScreenFailedState(this.error);
}
