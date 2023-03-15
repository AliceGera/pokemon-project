import 'package:flutter/material.dart';

class LoadMoreIndicatorWidget extends StatelessWidget {
  const LoadMoreIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10, bottom: 40),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
