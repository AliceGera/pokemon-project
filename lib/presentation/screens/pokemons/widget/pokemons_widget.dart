import 'package:flutter/material.dart';
import 'package:pokemon_project/presentation/screens/pokemons/data/pokemon_screen_data.dart';
import '../../information_about_pokemon/information_about_pokemon_screen.dart';

class PokemonsWidget extends StatelessWidget {
  final List<PokemonScreenItem> itemList;
  final ScrollController controller;

  const PokemonsWidget({
    super.key,
    required this.itemList,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        controller: controller,
        itemCount: itemList.length + 1,
        itemBuilder: (_, index) => index == 0
            ? Image.asset(
                'assets/images/pokemons.png',
                height: size.height * 0.3,
              )
            : InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    InformationAboutPokemonScreen.routeName,
                    arguments: itemList[index - 1].url,
                  );
                },
                child: Card(
                  color: Colors.indigo.withOpacity(.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            itemList[index - 1].name,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
