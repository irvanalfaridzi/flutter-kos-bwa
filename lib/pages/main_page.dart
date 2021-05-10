part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecommendedSpaces();
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
                    CityCard(City(
                        id: 1,
                        namaKota: "Jakarta",
                        urlImage: "assets/images/city-1.png")),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 2,
                        namaKota: "Bandung",
                        urlImage: "assets/images/city-2.png",
                        isPopular: true)),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 3,
                        namaKota: "Surabaya",
                        urlImage: "assets/images/city-3.png")),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 4,
                        namaKota: "Palembang",
                        urlImage: "assets/images/city-4.png")),
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
              SpaceCard(Space(
                  id: 1,
                  urlImage: "assets/images/kos-1.png",
                  star: 4,
                  namaSpace: "Kuetakeso Hott",
                  harga: 52,
                  city: "Bandung",
                  country: "Germany")),
              SizedBox(
                height: 30,
              ),
              SpaceCard(Space(
                  id: 2,
                  urlImage: "assets/images/kos-2.png",
                  star: 5,
                  namaSpace: "Roemah Nenek",
                  harga: 11,
                  city: "Seattle",
                  country: "Bogor")),
              SizedBox(
                height: 30,
              ),
              SpaceCard(Space(
                  id: 3,
                  urlImage: "assets/images/kos-3.png",
                  star: 4,
                  namaSpace: "Darrling How",
                  harga: 20,
                  city: "Jakarta",
                  country: "Indonesia")),
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
