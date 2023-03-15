import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PokemonInformationWidget extends StatelessWidget {
  final int weight;
  final int height;

  const PokemonInformationWidget({
    super.key,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context).weight,
                  style: const TextStyle(
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
              '$weight',
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context).height,
                  style: const TextStyle(
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
              '$height',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 44,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
