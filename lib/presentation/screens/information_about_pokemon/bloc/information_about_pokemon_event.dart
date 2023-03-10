part of 'information_about_pokemon_bloc.dart';

@immutable
abstract class InformationAboutPokemonScreenEvent {}

class LoadInformationAboutPokemonScreenEvent extends InformationAboutPokemonScreenEvent {
  final String url;
  LoadInformationAboutPokemonScreenEvent(this.url);
}
