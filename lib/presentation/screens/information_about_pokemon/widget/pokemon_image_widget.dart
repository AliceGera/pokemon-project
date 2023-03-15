import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonImageWidget extends StatelessWidget {

final String imageUrl;
  const PokemonImageWidget({
    super.key, required this.imageUrl ,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      height: size.height * 0.25,
      fit: BoxFit.fitHeight,
      imageUrl: imageUrl,
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
    );
  }
}
