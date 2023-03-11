import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../widget/circular_progress_indicator_widget.dart';
import '../../widget/failed_widget.dart';
import 'bloc/information_about_pokemon_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      create: (context) => GetIt.I.get<InformationAboutPokemonScreenBloc>()
        ..add(
          LoadInformationAboutPokemonScreenEvent(url ?? ''),
        ),
      child: BlocBuilder<InformationAboutPokemonScreenBloc, InformationAboutPokemonScreenState>(
        builder: (context, state) {
          if (state is InformationAboutPokemonScreenLoadingState || state is InformationAboutPokemonScreenInitialState) {
            return const CircularProgressIndicatorWidget();
          } else if (state is InformationAboutPokemonScreenFailedState) {
            return const FailedWidget();
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
                        SizedBox(height: size.height * 0.05),
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
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  height: size.height * 0.3,
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
                                Text(
                                  "weight: ${state.data.weight}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "height: ${state.data.height}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
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
                                  fontSize: 18,
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
