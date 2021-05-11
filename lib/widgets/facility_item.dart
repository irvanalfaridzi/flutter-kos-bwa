part of 'widgets.dart';

class FacilityItem extends StatelessWidget {
  final String urlImage;
  final int jumlah;
  final String jenisFacility;

  FacilityItem(
    this.urlImage,
    this.jumlah,
    this.jenisFacility,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          urlImage,
          width: 32,
          height: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
              text: jumlah.toString(),
              style: judulText.copyWith(color: primaryColor, fontSize: 14),
              children: [
                TextSpan(
                    text: " " + jenisFacility,
                    style: isiText.copyWith(fontSize: 14))
              ]),
        ),
      ],
    );
  }
}
