class PokemonData {
  final List<PokemonItem>? pokemonList;

  PokemonData({
    this.pokemonList,
  });
}

class PokemonItem {

  final String? name;
  final String? url;

  PokemonItem(
      this.name,
      this.url,
      );
}
