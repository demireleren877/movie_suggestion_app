import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/localization/app_localizations.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            AppLocalizations.instance.translate("image_viewer_title") ?? ""),
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
