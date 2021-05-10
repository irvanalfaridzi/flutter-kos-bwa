part of 'widgets.dart';

class TipCard extends StatelessWidget {
  final Tip tip;

  TipCard(this.tip);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tip.imgUrl,
          width: 80,
          height: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tip.namaTip,
              style: judulText.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Updated ${tip.date}",
              style: isiText.copyWith(fontSize: 14),
            )
          ],
        ),
        Spacer(),
        IconButton(
            icon: Icon(
              Icons.chevron_right,
            ),
            onPressed: () {}),
      ],
    );
  }
}
