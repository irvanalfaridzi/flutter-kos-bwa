part of 'widgets.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 120,
        height: 150,
        color: greyBgColor,
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                city.urlImage,
                width: 120,
                height: 102,
                fit: BoxFit.cover,
              ),
              city.isPopular
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                                "assets/images/Icon_star_solid.png", width: 20, height: 20),
                          )),
                    )
                  : Container()
            ]),
            SizedBox(
              height: 11,
            ),
            Text(
              city.namaKota,
              style: judulText.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
