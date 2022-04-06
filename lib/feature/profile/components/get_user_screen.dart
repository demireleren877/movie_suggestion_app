part of "../profile_page.dart";

class _GetUser extends StatelessWidget {
  _GetUser({Key? key}) : super(key: key);
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
