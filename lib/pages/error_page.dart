part of 'pages.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/404.png",
              width: 300,
              height: 86,
            ),
            SizedBox(
              height: 70,
            ),
            Text("Where are you going?", style: judulText),
            SizedBox(
              height: 14,
            ),
            Text(
              "Seems like the page that you were\nrequested is already gone",
              textAlign: TextAlign.center,
              style: isiText,
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return MainPage();
                }), (route) => false);
              },
              child: Container(
                width: 210,
                height: 50,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(17))),
                child: Center(
                  child: Text(
                    "Back to Home",
                    style: buttonText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
