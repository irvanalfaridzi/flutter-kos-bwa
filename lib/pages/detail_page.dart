part of 'pages.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  DetailPage(this.space);
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ErrorPage();
        }));
      }
    }

    int index = 0;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      space.urlImage,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 328,
                    width: 100,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                        left: edge,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: 24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      space.namaSpace,
                                      style: judulText.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: "\$ ${space.harga}",
                                        style: judulText.copyWith(
                                          color: primaryColor,
                                          fontSize: 16,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: " / month",
                                            style: isiText,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [1, 2, 3, 4, 5].map((index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                        left: 2,
                                      ),
                                      child: RatingItem(
                                        index: index,
                                        rating: space.star,
                                      ),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Main Facilities",
                            style: judulText.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: edge,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FacilityItem(
                                  "assets/images/001-bar-counter.png",
                                  space.numberKitchens,
                                  "kitchen",
                                ),
                                FacilityItem(
                                  "assets/images/002-double-bed.png",
                                  space.numberBedrooms,
                                  "bedroom",
                                ),
                                FacilityItem(
                                  "assets/images/003-cupboard.png",
                                  space.numberCupboards,
                                  "big lemari",
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Photos",
                            style: judulText.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 88,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: space.photo.map(
                                (item) {
                                  index++;
                                  return Container(
                                    margin: EdgeInsets.only(
                                      right: index == 0 ? 0 : edge,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        item,
                                        width: 110,
                                        height: 88,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Location",
                            style: judulText.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: edge),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${space.address}\n${space.city}",
                                  style: isiText.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                InkWell(
                                  onTap: () {
                                    // launchUrl(
                                    //     "https://goo.gl/maps/Cyb6ZXTPD9EmMK6A6");
                                    launchUrl(space.mapUrl);
                                  },
                                  child: Image.asset(
                                    "assets/images/btn_location.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            width:
                                MediaQuery.of(context).size.width - (edge * 2),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17)),
                              color: primaryColor,
                              onPressed: () {
                                launchUrl("tel:${space.phone}");
                              },
                              child: Text(
                                "Book Now",
                                style: buttonText,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: edge),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      child: FloatingActionButton(
                        heroTag: 1,
                        backgroundColor: whiteColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: FloatingActionButton(
                        heroTag: 2,
                        backgroundColor: whiteColor,
                        onPressed: () {},
                        child: Icon(
                          Icons.favorite_border,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
