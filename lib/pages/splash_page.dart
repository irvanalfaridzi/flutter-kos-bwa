part of "pages.dart";

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset("assets/images/bg_splash.png")),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Find Cozy House\nto Stay and Happy",
                        style: judulText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                        style: isiText,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        width: 210,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          color: primaryColor,
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MainPage();
                            }));
                          },
                          child: Text(
                            "Explore Now",
                            style: buttonText,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
