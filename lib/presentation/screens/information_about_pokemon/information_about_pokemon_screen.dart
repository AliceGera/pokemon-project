import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
                        SizedBox(height: size.height * 0.04),
                        const Text(
                          "The pokemon",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 44,
                          ),
                        ),
                        Text(
                          state.data.name.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 44,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.7,
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                height: size.height * 0.25,
                                fit: BoxFit.fitHeight,
                                imageUrl: state.data.imagePokemon,
                                progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => const Icon(
                                  Icons.error,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'weight:',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/weights.png',
                                        height: size.height * 0.2,
                                      ),
                                      Text(
                                        '${state.data.weight}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 44,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'height:',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/height.png',
                                        height: size.height * 0.2,
                                      ),
                                      Text(
                                        '${state.data.height}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 44,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    'Types:',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.data.types.length,
                                    itemBuilder: (BuildContext context, int index) => Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        (state.data.types.length > 1 && index != state.data.types.length - 1)
                                            ? "${state.data.types[index]},"
                                            : state.data.types[index],
                                        style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lime,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Back',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
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
