import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_project/presentation/screens/information_about_pokemon/widget/pokemon_button_widget.dart';
import 'package:pokemon_project/presentation/screens/information_about_pokemon/widget/pokemon_image_widget.dart';
import 'package:pokemon_project/presentation/screens/information_about_pokemon/widget/pokemon_information_widget.dart';
import 'package:pokemon_project/presentation/screens/information_about_pokemon/widget/pokemon_title_widget.dart';
import 'package:pokemon_project/presentation/screens/information_about_pokemon/widget/pokemon_types_widget.dart';
import '../../../domain/interactor/information_about_pokemon_interactor.dart';
import '../../widget/circular_progress_indicator_widget.dart';
import '../../widget/failed_widget.dart';
import 'bloc/information_about_pokemon_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'information_about_pokemon_view_mapper.dart';

class InformationAboutPokemonScreen extends StatefulWidget {
  static const routeName = '/information_about_pokemon';

  const InformationAboutPokemonScreen({Key? key}) : super(key: key);

  @override
  State<InformationAboutPokemonScreen> createState() => _InformationAboutPokemonScreenState();
}

class _InformationAboutPokemonScreenState extends State<InformationAboutPokemonScreen> {
  String? url;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
    final size = MediaQuery.of(context).size;
    url = ModalRoute.of(context)?.settings.arguments as String?;
    return BlocProvider(
      create: (context) => InformationAboutPokemonScreenBloc(
        GetIt.I.get<InformationAboutPokemonInteractor>(),
        GetIt.I.get<InformationAboutPokemonViewMapper>(),
      )..add(
          LoadInformationAboutPokemonScreenEvent(url ?? ''),
        ),
      child: BlocBuilder<InformationAboutPokemonScreenBloc, InformationAboutPokemonScreenState>(
        builder: (context, state) {
          if (state is InformationAboutPokemonScreenLoadingState || state is InformationAboutPokemonScreenInitialState) {
            return const CircularProgressIndicatorWidget();
          } else if (state is InformationAboutPokemonScreenFailedState) {
            return FailedWidget(
              tapCallBack: () {
                BlocProvider.of<InformationAboutPokemonScreenBloc>(context).add(
                  LoadInformationAboutPokemonScreenEvent(url ?? ''),
                );
              },
              error: state.error,
            );
          } else if (state is InformationAboutPokemonScreenSuccessState) {
            return SafeArea(
              child: Scaffold(
                body: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.lightGreen,
                        Colors.orangeAccent,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        PokemonTitleWidget(name: state.data.name.toString()),
                        SizedBox(
                          height: size.height * 0.7,
                          child: Column(
                            children: [
                              PokemonImageWidget(imageUrl: state.data.imagePokemon),
                              PokemonInformationWidget(
                                weight: state.data.weight,
                                height: state.data.height,
                              ),
                              PokemonTypesWidget(types: state.data.types),
                            ],
                          ),
                        ),
                        const PokemonButtonWidget(),
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
