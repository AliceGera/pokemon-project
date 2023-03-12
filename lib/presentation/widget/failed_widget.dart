import 'package:flutter/material.dart';
import 'package:pokemon_project/data/model/exception/api_global_exception.dart';
import 'package:pokemon_project/data/model/exception/api_no_internet_exception.dart';

class FailedWidget extends StatelessWidget {
  final VoidCallback tapCallBack;
  final dynamic error;

  const FailedWidget({
    super.key,
    required this.tapCallBack,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    String stringError = '';
    final size = MediaQuery.of(context).size;
    if (error is ApiNoInternetException) {
      stringError = 'No internet connection found. Check\n your connection and try again.!';
    } else if (error is ApiGlobalException) {
      final errorMessage = (error as ApiGlobalException).message;
      stringError = 'Problems with api.\nError message: $errorMessage';
    } else {
      stringError = 'Try later.';
    }

    return Scaffold(
      body: Container(
        width: size.width,
        color: const Color(0xFF3589C2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.2),
              const Text(
                'Oooops!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                stringError,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: size.height * 0.5),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: tapCallBack,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Try again',
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
    );
  }
}
