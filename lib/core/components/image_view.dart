import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Image Viewer'),
      ),
      body: Center(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: InteractiveViewer(
            child: Image.network(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
