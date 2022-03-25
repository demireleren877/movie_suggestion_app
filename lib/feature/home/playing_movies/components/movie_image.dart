import 'package:flutter/material.dart';

import '../../../../core/constants/api_constants.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        ApiConstants.imageurl + image,
        fit: BoxFit.cover,
      ),
    );
  }
}
