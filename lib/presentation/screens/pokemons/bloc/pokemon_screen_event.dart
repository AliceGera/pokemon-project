part of 'pokemon_screen_bloc.dart';

@immutable
abstract class PokemonScreenEvent {}
class LoadMorePokemonsScreenEvent extends PokemonScreenEvent {
  final bool isFirstLoading;
  LoadMorePokemonsScreenEvent([this.isFirstLoading=false]);
}
