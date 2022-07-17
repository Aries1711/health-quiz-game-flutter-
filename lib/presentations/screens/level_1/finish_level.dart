// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/logic/function/global_preferences.dart';
import 'package:game_health_efa/logic/function/helper.dart';
import 'package:game_health_efa/presentations/widgets/button_general_seconday.dart';
import 'package:google_fonts/google_fonts.dart';

class FinishScreenLevelA extends StatefulWidget {
  final String title;
  FinishScreenLevelA({Key? key, required this.title}) : super(key: key);

  @override
  State<FinishScreenLevelA> createState() => _FinishScreenLevelAState();
}

class _FinishScreenLevelAState extends State<FinishScreenLevelA> {
  HelperFunction helperFunction = HelperFunction();
  GlobalPreferences globalPreferences = GlobalPreferences();
  String nameUser = "", genderUser = "", birthdateUser = "";

  Future<Object> showDialogToIntro(BuildContext context, Size size) async {
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
                      "YAKIN ?",
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
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      "Kamu akan kembali kehalaman utama semua progress kamu akan direset",
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
                        Navigator.pop(context);
                      },
                      backgroundColor: colorGreySoft,
                      widgetChild: Text(
                        "BATAL",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: colorBlackPrimary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      textColor: colorWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ButtonGeneralSecondary(
                      onPress: () async {
                        await globalPreferences.resetData();
                        await Navigator.of(context).pushNamed('/');
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

  Future<Object> showDialogToLevels(BuildContext context, Size size) async {
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
                      "SEMANGAT!!",
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
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      "Yuk mulai dengan level baru, dan buktikan kalo kamu bisa!!",
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
                        Navigator.pop(context);
                      },
                      backgroundColor: colorGreySoft,
                      widgetChild: Text(
                        "BATAL",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: colorBlackPrimary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      textColor: colorWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ButtonGeneralSecondary(
                      onPress: () {
                        Navigator.of(context).pushNamed('/level');
                      },
                      backgroundColor: colorPurplePrimary,
                      widgetChild: Text(
                        "MULAI",
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

  onLoadPage() async {
    String nameUserString = await globalPreferences.getFullname();
    String birthdateUserString = await globalPreferences.getBirthdate();
    String genderUserString = await globalPreferences.getGender();
    print(genderUserString);

    setState(() {
      nameUser = nameUserString;
      birthdateUser = birthdateUserString;
      genderUser = genderUserString;
    });
  }

  @override
  void initState() {
    super.initState();
    onLoadPage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorYellowPrimary,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: size.height * 0.3),
            height: size.height * 0.7,
            width: size.width,
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 80),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Hore akhirnya selesai!!",
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
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset("assets/images/icon-correct.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    genderUser == "Laki-laki"
                        ? "assets/images/logo-men.png"
                        : "assets/images/logo-women.png",
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      nameUser,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: colorBlackSecondary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: colorPurplePrimary),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Image.asset("assets/images/icon-correct.png"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Skor akhir level 1",
                            textAlign: TextAlign.center,
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
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "100",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: colorBlackSecondary,
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            child: Container(
              width: size.width,
              child: Align(
                alignment: Alignment.center,
                child: ButtonGeneralSecondary(
                  onPress: () {
                    showDialogToLevels(context, size);
                  },
                  backgroundColor: colorPurplePrimary,
                  widgetChild: Text(
                    "MAIN LAGI",
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
            ),
          ),
          Positioned(
            bottom: 30,
            child: Container(
              width: size.width,
              child: Align(
                alignment: Alignment.center,
                child: ButtonGeneralSecondary(
                  onPress: () {
                    showDialogToIntro(context, size);
                  },
                  backgroundColor: colorOrange,
                  widgetChild: Text(
                    "KE HALAMAN UTAMA",
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
            ),
          ),
        ],
      ),
    );
  }
}
