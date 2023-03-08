import 'package:flutter/material.dart';

class GeolocationErrorWidget extends StatelessWidget {
  final String errorMessage;
  const GeolocationErrorWidget({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.error,
          size: 40,
          color: Colors.red,
        ),
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
