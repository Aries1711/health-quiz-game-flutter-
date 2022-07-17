// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/presentations/widgets/button_general.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  String title;
  IntroScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorYellowPrimary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 120),
              width: size.width * 0.6,
              child: Image.asset(
                "assets/images/logo-efa.png",
                fit: BoxFit.contain,
                width: size.width * 0.6,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 80),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Education First Game adalah game quis seputar pertolongan pertama",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: colorBlackSecondary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 150, bottom: 20, left: 20, right: 20),
              child: ButtonGeneral(
                  onPress: () {
                    Navigator.of(context).pushNamed('/biodata');
                  },
                  backgroundColor: colorWhite,
                  widgetChild: Text(
                    "Mulai",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colorBlackSecondary,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  textColor: colorBlackPrimary),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
              child: ButtonGeneral(
                  onPress: () {
                    Navigator.of(context).pushNamed('/info');
                  },
                  backgroundColor: colorPurplePrimary,
                  widgetChild: Text(
                    "Tentang Game",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colorWhite,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  textColor: colorBlackPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
