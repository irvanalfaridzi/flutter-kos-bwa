part of 'widgets.dart';

class BottomNavbarItem extends StatelessWidget {
  final String urlImage;
  final bool isSelected;

  BottomNavbarItem({this.urlImage, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          urlImage,
          width: 26,
          height: 26,
          color: isSelected ? navbarBtnColor : Color(0xFF989BA1),
        ),
        Spacer(),
        isSelected
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    color: navbarBtnColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1000))),
              )
            : Container()
      ],
    );
  }
}
