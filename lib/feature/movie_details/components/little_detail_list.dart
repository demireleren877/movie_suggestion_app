part of "../detail_screen.dart";

class _LittleMovieDetails extends StatelessWidget {
  _LittleMovieDetails({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final MovieDetail detail;
  final _currencyFormatter = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _LittleMovieDetailWidget(
          title: AppLocalizations.of(context)?.translate("budget") ?? "",
          text: "\$" + _currencyFormatter.format(int.parse(detail.budget)),
        ),
        _LittleMovieDetailWidget(
          title: AppLocalizations.of(context)?.translate("runtime") ?? "",
          text: detail.runtime +
              (AppLocalizations.instance.translate("min") ?? ""),
        ),
        _LittleMovieDetailWidget(
          title: AppLocalizations.of(context)?.translate("release_date") ?? "",
          text: detail.releaseDate,
        ),
      ],
    );
  }
}
