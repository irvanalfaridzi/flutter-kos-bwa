part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final Space space;
  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;
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

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Would you like to call the owner of ${widget.space.namaSpace}?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  launchUrl("tel:${widget.space.phone}");
                },
              ),
            ],
          );
        },
      );
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
                    widget.space.urlImage,
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
                                    widget.space.namaSpace,
                                    style: judulText.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "\$ ${widget.space.harga}",
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
                                      rating: widget.space.star,
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
                                widget.space.numberKitchens,
                                "kitchen",
                              ),
                              FacilityItem(
                                "assets/images/002-double-bed.png",
                                widget.space.numberBedrooms,
                                "bedroom",
                              ),
                              FacilityItem(
                                "assets/images/003-cupboard.png",
                                widget.space.numberCupboards,
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
                            children: widget.space.photo.map(
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
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
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
                                "${widget.space.address}\n${widget.space.city}",
                                style: isiText.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // launchUrl(
                                  //     "https://goo.gl/maps/Cyb6ZXTPD9EmMK6A6");
                                  launchUrl(widget.space.mapUrl);
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
                          width: MediaQuery.of(context).size.width - (edge * 2),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            color: primaryColor,
                            onPressed: () {
                              _showMyDialog();
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
              padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: edge,
              ),
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
                      onPressed: () {
                        if (isClicked == false) {
                          setState(() {
                            isClicked = true;
                          });
                        } else {
                          setState(() {
                            isClicked = false;
                          });
                        }
                      },
                      child: isClicked
                          ? Icon(
                              Icons.favorite,
                              color: secondaryColor,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: primaryColor,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
