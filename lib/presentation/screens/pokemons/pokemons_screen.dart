
import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      GetIt.I.get<PokemonScreenBloc>()
        ..add(LoadPokemonScreenEvent()),
      child: BlocBuilder<PokemonScreenBloc, PokemonScreenState>(
        builder: (context, state) {
          if (state is PokemonScreenLoadingState ||
              state is PokemonScreenInitialState) {
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
                   // iconTheme: const IconThemeData(color: Colors.black),
                    backgroundColor: const Color(0xFFFCFCFC),
                    centerTitle: true,
                    elevation: 0,

                  ),
                  body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(),
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