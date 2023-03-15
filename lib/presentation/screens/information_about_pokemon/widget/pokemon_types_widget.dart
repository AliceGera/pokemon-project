import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PokemonTypesWidget extends StatelessWidget {
  final List<String> types;

  const PokemonTypesWidget({
    super.key,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
         SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 8,
            ),
            child: Text(
              AppLocalizations.of(context).pokemon,
              style: const TextStyle(
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
              itemCount: types.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  (types.length > 1 && index != types.length - 1)
                      ? "${types[index]},"
                      : types[index],
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
    );
  }
}
