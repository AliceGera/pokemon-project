import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../widget/failed_widget.dart';
import '../information_about_pokemon/information_about_pokemon_screen.dart';
import 'bloc/pokemon_screen_bloc.dart';
import '../../widget/circular_progress_indicator_widget.dart';

class PokemonsScreen extends StatefulWidget {
  static const routeName = '/pokemons';

  const PokemonsScreen({Key? key}) : super(key: key);

  @override
  State<PokemonsScreen> createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
  }

  void setupScrollController(BuildContext context) {
    _controller.addListener(() {
      if (_controller.position.extentAfter < 300) {
        BlocProvider.of<PokemonScreenBloc>(context).add(
          LoadMorePokemonsScreenEvent(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GetIt.I.get<PokemonScreenBloc>()
        ..add(
          LoadMorePokemonsScreenEvent(true),
        ),
      child: BlocBuilder<PokemonScreenBloc, PokemonScreenState>(
        builder: (context, state) {
          if (state is PokemonScreenInitialState) {
            setupScrollController(context);
          }
          if (state is PokemonScreenLoadingState || state is PokemonScreenInitialState) {
            return const CircularProgressIndicatorWidget();
          } else if (state is PokemonScreenFailedState) {
            return const FailedWidget();
          } else if (state is PokemonScreenSuccessState) {
            return SafeArea(
              child: Scaffold(
                body: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue,
                        Colors.red,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/pokemon_logo-removebg-preview.png',
                        height: size.height * 0.2,
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: _controller,
                          itemCount: state.data.itemList.length + 1,
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
                                      arguments: state.data.itemList[index-1].url,
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
                                              state.data.itemList[index-1].name,
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
                      ),
                      if (state.data.isLoadMore == true)
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 40),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      if (state.data.isHasNext == false)
                        Container(
                          padding: const EdgeInsets.only(top: 30, bottom: 30),
                          color: Colors.transparent,
                          child: const Center(
                            child: Text(
                              'You have fetched all of the content',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
