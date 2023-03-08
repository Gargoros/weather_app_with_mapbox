import 'package:flutter/material.dart';

class ZoomInOutWidget extends StatelessWidget {
  final VoidCallback zoomInCallback;
  final VoidCallback zoomOutCallback;
  const ZoomInOutWidget({
    Key? key,
    required this.zoomInCallback,
    required this.zoomOutCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: zoomInCallback,
          child: const Icon(
            Icons.zoom_in,
            color: Colors.blue,
            size: 30,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        FloatingActionButton(
          onPressed: zoomOutCallback,
          child: const Icon(
            Icons.zoom_out,
            color: Colors.blue,
            size: 30,
          ),
        ),
      ],
    );
  }
}
