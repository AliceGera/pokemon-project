import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PokemonTitleWidget extends StatelessWidget {
  final String name;

  const PokemonTitleWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.04),
          Text(
         AppLocalizations.of(context).pokemon,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 44,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 44,
          ),
        ),
      ],
    );
  }
}
