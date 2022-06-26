// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/logic/function/global_preferences.dart';
import 'package:game_health_efa/logic/function/helper.dart';
import 'package:game_health_efa/presentations/widgets/button_general.dart';
import 'package:game_health_efa/presentations/widgets/button_general_seconday.dart';
import 'package:game_health_efa/presentations/widgets/card_level.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelsScreen extends StatefulWidget {
  final String title;
  LevelsScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  GlobalPreferences globalPreferences = GlobalPreferences();
  HelperFunction helperFunction = HelperFunction();

  Future<Object> showDialogStart(BuildContext context, Size size) async {
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
            child: Container(
              height: 280,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Level 1",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: colorPurplePrimary,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Mudah banget",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: colorBlackSecondary,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Berisikan 7 pertanyaan dengan ketentuan (skor benar 5, salah 0, tanpa batas waktu)",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: colorBlackSecondary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Game akan dimulai saat kamu klik start",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: ButtonGeneralSecondary(
                              onPress: () {
                                Navigator.pop(context);
                              },
                              backgroundColor: colorGrey,
                              widgetChild: Text(
                                "BATAL",
                                style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorBlackSecondary,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              textColor: colorWhite),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: ButtonGeneralSecondary(
                              onPress: () {
                                Navigator.of(context)
                                    .pushNamed('/level_a/question_a');
                              },
                              backgroundColor: colorPurplePrimary,
                              widgetChild: Text(
                                "START",
                                style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorWhite,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              textColor: colorWhite),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorYellowPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "E-Fa (Education First Aid)",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: colorBlackPrimary,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Image.asset("assets/images/logo_efa.png"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorWhite,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset("assets/images/logo-men.png"),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Arisqi Setyawan",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorBlackPrimary,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "27 Februari 2022",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorBlackSecondary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pilih Level Gamenya",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: colorBlackSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            CardLevel(
              size: size,
              textLevel: "Level 1",
              textSubtitle: "Mudah banget",
              backgroundColor: colorWhite,
              onPress: () {
                showDialogStart(context, size);
              },
            ),
            CardLevel(
              size: size,
              textLevel: "Level 2",
              textSubtitle: "Yang bikin terburu-buru",
              backgroundColor: colorGrey,
              onPress: () {
                helperFunction.toastMessage("Maaf belum bisa pilih level ini");
              },
            ),
            CardLevel(
              size: size,
              textLevel: "Level 3",
              textSubtitle: "Senam jantung yuk",
              backgroundColor: colorGrey,
              onPress: () {
                helperFunction.toastMessage("Maaf belum bisa pilih level ini");
              },
            ),
          ],
        ),
      ),
    );
  }
}
