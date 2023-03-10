import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokemon_project/di/injector.dart';
import 'package:pokemon_project/presentation/screens/information_about_pokemon/information_about_pokemon_screen.dart';
import 'package:pokemon_project/presentation/screens/pokemons/pokemons_screen.dart';

void main() {
  configureInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(primaryColor: Colors.amber),
      initialRoute: PokemonsScreen.routeName,
      routes: {
        PokemonsScreen.routeName: (context) => const PokemonsScreen(),
        InformationAboutPokemonScreen.routeName :(context) => const InformationAboutPokemonScreen(),
      },
    );
  }
}
