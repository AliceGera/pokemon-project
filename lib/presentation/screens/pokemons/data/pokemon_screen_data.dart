class PokemonScreenData {
  List<PokemonScreenItem> itemList;
  int offset;
  bool isLoadMore;
  bool isHasNext;
  int limit;

  PokemonScreenData(
    this.itemList,
    this.offset, [
    this.isHasNext = false,
    this.isLoadMore = false,
    this.limit = 20,
  ]);
}

class PokemonScreenItem {
  final String name;
  final String url;

  PokemonScreenItem(
    this.name,
    this.url,
  );
}
