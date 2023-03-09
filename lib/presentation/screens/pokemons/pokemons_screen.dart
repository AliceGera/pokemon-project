import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../widget/failed_widget.dart';
import 'bloc/pokemon_screen_bloc.dart';
import '../../widget/circular_progress_indicator_widget.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
  }

  void setupScrollController(BuildContext context) {
    _controller.addListener(() {
      print(11111);
      if (_controller.position.extentAfter < 300) {
        BlocProvider.of<PokemonScreenBloc>(context).add(
          LoadMorePokemonsScreenEvent(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: const Color(0xFFFCFCFC),
                  appBar: AppBar(
                    backgroundColor: const Color(0xFFFCFCFC),
                    centerTitle: true,
                    elevation: 0,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: state.data.itemList.length,
                      itemBuilder: (_, index) => Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        child: Text(
                          state.data.itemList[index].name,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
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
