// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/logic/function/global_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  String title;
  SplashScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<SplashScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<SplashScreen> {
  GlobalPreferences globalPreferences = GlobalPreferences();

  onLoadPage() async {
    String fullname = await globalPreferences.getFullname();
    if (fullname == "" || fullname == null) {
      await Future.delayed(Duration(milliseconds: 3000));
      Navigator.of(context).pushNamed('/intro');
    } else {
      await Future.delayed(Duration(milliseconds: 3000));
      Navigator.of(context).pushNamed('/level');
    }
  }

  @override
  void initState() {
    super.initState();
    onLoadPage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: colorYellowPrimary,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height,
              ),
              Positioned(
                top: size.height * 0.2,
                width: size.width,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 120),
                    width: size.width * 0.6,
                    child: Image.asset(
                      "assets/images/logo-efa.png",
                      fit: BoxFit.contain,
                      width: size.width * 0.6,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 80),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Education First Aid Game",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: colorBlackSecondary,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
