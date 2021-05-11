part of 'widgets.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                space,
              );
            },
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    space.urlImage,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Image.asset(
                            "assets/images/Icon_star_solid.png",
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              "${space.star}/5",
                              style: judulText.copyWith(
                                fontSize: 13,
                                color: whiteColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  space.namaSpace,
                  style: judulText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                Text.rich(
                  TextSpan(
                      text: "\$ ${space.harga}",
                      style:
                          judulText.copyWith(color: primaryColor, fontSize: 16),
                      children: [TextSpan(text: " / month", style: isiText)]),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "${space.city}, ${space.country}",
                  style: isiText.copyWith(fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
