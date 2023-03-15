import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_project/presentation/screens/pokemons/pokemon_view_mapper.dart';
import 'package:pokemon_project/presentation/screens/pokemons/widget/load_more_indicator_widget.dart';
import 'package:pokemon_project/presentation/screens/pokemons/widget/pokemons_widget.dart';
import '../../../domain/interactor/pokemon_interactor.dart';
import '../../widget/failed_widget.dart';
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
      create: (context) => PokemonScreenBloc(
        GetIt.I.get<PokemonInteractor>(),
        GetIt.I.get<PokemonViewMapper>(),
      )..add(
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
            return FailedWidget(
              tapCallBack: () {
                BlocProvider.of<PokemonScreenBloc>(context).add(
                  LoadMorePokemonsScreenEvent(true),
                );
              },
              error: state.error,
            );
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
                        'assets/images/pokemon_logo.png',
                        height: size.height * 0.2,
                      ),
                      PokemonsWidget(itemList: state.data.itemList, controller: _controller),
                      if (state.data.isLoadMore == true) const LoadMoreIndicatorWidget(),
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
