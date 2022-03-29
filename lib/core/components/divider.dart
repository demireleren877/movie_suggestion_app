import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DetailPageDivider extends StatelessWidget {
  const DetailPageDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: const Divider(
        thickness: 1,
      ),
    );
  }
}
