part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: ListView(children: [
        Padding(
          padding: EdgeInsets.only(top: edge, left: edge, bottom: edge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore Now",
                style: judulText,
              ),
              Text(
                "Mencari kosan yang cozy",
                style: isiText,
              ),
              SizedBox(
                height: 30,
              ),

              // Popular Cities
              Text(
                "Popular Cities",
                style: judulText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(
                      City(
                        id: 1,
                        namaKota: "Jakarta",
                        urlImage: "assets/images/city-1.png",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 2,
                        namaKota: "Bandung",
                        urlImage: "assets/images/city-2.png",
                        isPopular: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 3,
                        namaKota: "Surabaya",
                        urlImage: "assets/images/city-3.png",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 4,
                        namaKota: "Palembang",
                        urlImage: "assets/images/city-4.png",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 5,
                        namaKota: "Aceh",
                        urlImage: "assets/images/city-5.png",
                        isPopular: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 4,
                        namaKota: "Bogor",
                        urlImage: "assets/images/city-6.png",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Recommended Space",
                style: judulText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 16,
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                child: FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;

                      int index = 0;

                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                            child: SpaceCard(item),
                          );
                        }).toList(),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 30,
              ),
              Text(
                "Recommended Space",
                style: judulText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(right: 24),
                child: Column(
                  children: [
                    TipCard(Tip(
                        id: 1,
                        namaTip: "City Guidelines",
                        imgUrl: "assets/images/tips-1.png",
                        date: "20 Apr")),
                    SizedBox(
                      height: 20,
                    ),
                    TipCard(Tip(
                        id: 2,
                        namaTip: "Jakarta Fairship",
                        imgUrl: "assets/images/tips-2.png",
                        date: "11 Dec")),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (edge * 2),
        decoration: BoxDecoration(
            color: greyBgColor,
            borderRadius: BorderRadius.all(Radius.circular(23))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              urlImage: "assets/images/home.png",
              isSelected: true,
            ),
            BottomNavbarItem(
              urlImage: "assets/images/mail.png",
              isSelected: false,
            ),
            BottomNavbarItem(
              urlImage: "assets/images/card.png",
              isSelected: false,
            ),
            BottomNavbarItem(
              urlImage: "assets/images/love.png",
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }
}
