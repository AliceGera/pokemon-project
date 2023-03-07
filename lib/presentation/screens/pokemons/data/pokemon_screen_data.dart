class PokemonScreenData {
  List<PokemonScreenItem> itemList;
  PokemonScreenData(
      this.itemList,
      );
}

class PokemonScreenItem {
  final String name;
  final String url;

  PokemonScreenItem(
      this.name,
      this.url,
      );
}
