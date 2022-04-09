part of "../detail_screen.dart";

class _HeaderShadow extends StatelessWidget {
  const _HeaderShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            const Color(0xFF252a31).withOpacity(1),
            const Color(0xFF252a31).withOpacity(0.0),
            const Color(0xFF252a31).withOpacity(0.3),
            const Color(0xFF252a31).withOpacity(0.15),
          ],
        ),
      ),
    );
  }
}
