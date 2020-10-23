import 'package:flutter/material.dart';
import 'package:happy/app/modules/home/home_page.dart';
// import 'package:happy/app/modules/home/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class PrimeiraTela extends StatefulWidget {
  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text(
        "Manaus \n Amazonas",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      seconds: 5,
      navigateAfterSeconds: HomePage(),
      image: Image.asset('assets/images/Logotipo.png'),
      gradientBackground: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            0.3,
            1
          ],
          colors: [
            Color(0xFFF2AB5D1),
            Color(0xFFF00C7C7),
          ]),
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100,
      loaderColor: Colors.white,
      loadingText: Text(
        "Carregando...",
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
