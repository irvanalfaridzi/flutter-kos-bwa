part of 'widgets.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;
  RatingItem({this.index, this.rating});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/Icon_star_solid.png",
      width: 20,
      height: 20,
      color: index <= rating ? null : greyTextColor,
    );
  }
}
