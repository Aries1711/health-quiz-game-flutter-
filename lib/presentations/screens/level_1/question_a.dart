// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/logic/function/helper.dart';
import 'package:game_health_efa/presentations/widgets/button_general.dart';
import 'package:game_health_efa/presentations/widgets/button_general_seconday.dart';
import 'package:game_health_efa/presentations/widgets/card_player.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionA extends StatefulWidget {
  final String title;
  QuestionA({Key? key, required this.title}) : super(key: key);

  @override
  State<QuestionA> createState() => _QuestionAState();
}

class _QuestionAState extends State<QuestionA> {
  HelperFunction helperFunction = HelperFunction();

  launchDescriptionUrl() async {
    // Uri surveyUrlPatch = Uri(
    //     scheme: 'https', host: 'www.youtube.com', path: '/watch?v=odjUjKzVDXo');
    Uri surveyUrlPatch =
        Uri.parse('https://www.youtube.com/watch?v=odjUjKzVDXo');
    helperFunction.launchUrlExternal(surveyUrlPatch);
  }

  Future<Object> showDialogCorrect(BuildContext context, Size size) async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          child: child,
          scale: Tween<double>(end: 1.0, begin: 0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(0.00, 0.50, curve: Curves.linear),
            ),
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter myState) {
          return Dialog(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: Text(
                      "BENAR",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: colorPurplePrimary,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset('assets/images/icon-correct.png'),
                  ),
                  Center(
                    child: Image.asset('assets/images/level_a/question_a.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      "Pada gambar tersebut ditampilkan kondisi perlukaan yang terjadi secara tiba-tiba pada bagian tubuh kita. Kondisi ini dikenal dengan istilah Cedera. Cedera dialami sekitar 4,7 juta orang di dunia setiap tahun.",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: colorBlackSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: ButtonGeneralSecondary(
                      onPress: () {
                        launchDescriptionUrl();
                      },
                      backgroundColor: colorPurplePrimary,
                      widgetChild: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "VIDEO PENJELASAN",
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: colorWhite,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Image.asset('assets/images/youtube-button.png')
                        ],
                      ),
                      textColor: colorWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ButtonGeneralSecondary(
                      onPress: () {
                        Navigator.of(context).pushNamed('/level_a/finish');
                      },
                      backgroundColor: colorPurplePrimary,
                      widgetChild: Text(
                        "LANJUT",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: colorWhite,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      textColor: colorWhite,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Future<Object> showDialogWrong(BuildContext context, Size size) async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          child: child,
          scale: Tween<double>(end: 1.0, begin: 0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(0.00, 0.50, curve: Curves.linear),
            ),
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter myState) {
          return Dialog(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: Text(
                      "SALAH",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: colorPurplePrimary,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset('assets/images/icon-wrong.png'),
                  ),
                  Center(
                    child: Image.asset('assets/images/level_a/question_a.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      "Pada gambar tersebut ditampilkan kondisi perlukaan yang terjadi secara tiba-tiba pada bagian tubuh kita. Kondisi ini dikenal dengan istilah Cedera. Cedera dialami sekitar 4,7 juta orang di dunia setiap tahun.",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: colorBlackSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: ButtonGeneralSecondary(
                      onPress: () {
                        launchDescriptionUrl();
                      },
                      backgroundColor: colorPurplePrimary,
                      widgetChild: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "VIDEO PENJELASAN",
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: colorWhite,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Image.asset('assets/images/youtube-button.png')
                        ],
                      ),
                      textColor: colorWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ButtonGeneralSecondary(
                      onPress: () {
                        Navigator.of(context).pushNamed('/level_a/finish');
                      },
                      backgroundColor: colorPurplePrimary,
                      widgetChild: Text(
                        "LANJUT",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: colorWhite,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      textColor: colorWhite,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorYellowPrimary,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(minHeight: size.height),
                  width: size.width,
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: Image.asset(
                            'assets/images/level_a/question_a.png',
                            height: 250,
                            fit: BoxFit.contain),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 60,
            child: CardPlayer(size: size),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              margin: EdgeInsets.only(),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kondisi luka yang terjadi tiba-tiba pada tubuh kita disebut ?",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: colorBlackPrimary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: ButtonGeneralSecondary(
                      onPress: () {
                        showDialogCorrect(context, size);
                      },
                      backgroundColor: colorPurplePrimary,
                      widgetChild: Text(
                        "Cedera",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: colorWhite,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      textColor: colorWhite,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: ButtonGeneralSecondary(
                      onPress: () {
                        showDialogWrong(context, size);
                      },
                      backgroundColor: colorPurplePrimary,
                      widgetChild: Text(
                        "Pingsan",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: colorWhite,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      textColor: colorWhite,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: ButtonGeneralSecondary(
                      onPress: () {
                        showDialogWrong(context, size);
                      },
                      backgroundColor: colorPurplePrimary,
                      widgetChild: Text(
                        "Darah",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: colorWhite,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      textColor: colorWhite,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
