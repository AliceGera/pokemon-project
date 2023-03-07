class PokemonData {
  final List<PokemonItem>? pokemonList;
  final int? offset;
  final int? limit;

  PokemonData({
    this.pokemonList,
    this.offset,
    this.limit,
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
