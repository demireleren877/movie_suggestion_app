import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_application/core/localization/app_localizations.dart';
import 'package:movie_application/feature/profile/cubit/profile_cubit.dart';

class GetUser extends StatelessWidget {
  GetUser({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (AppLocalizations.instance.translate("enter_user_name") ?? ""),
            style: context.textTheme.headline6,
          ),
          context.emptySizedHeightBoxLow3x,
          TextField(
            onSubmitted: (value) {
              context.read<ProfileCubit>().saveUser(_controller.text);
            },
            controller: _controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.done),
                onPressed: () {
                  context.read<ProfileCubit>().saveUser(_controller.text);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
