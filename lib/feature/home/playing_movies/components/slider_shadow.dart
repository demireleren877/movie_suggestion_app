part of '../../home_screen.dart';

class _SliderShadow extends StatelessWidget {
  const _SliderShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.05),
            Colors.black.withOpacity(0.02),
            Colors.black.withOpacity(0.01),
          ],
        ),
      ),
    );
  }
}
