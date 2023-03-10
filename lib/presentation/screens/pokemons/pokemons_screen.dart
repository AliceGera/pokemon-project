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
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SafeArea(
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
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'List of pokemons',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: _controller,
                            itemCount: state.data.itemList.length,
                            itemBuilder: (_, index) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  InformationAboutPokemonScreen.routeName,
                                  arguments: state.data.itemList[index].url,
                                );
                              },
                              child: Card(
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
                                          state.data.itemList[index].name,
                                          style: const TextStyle(
                                            fontSize: 26,
                                          ),
                                        ),
                                        Text(
                                          state.data.itemList[index].url,
                                          style: const TextStyle(
                                            fontSize: 26,
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
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
