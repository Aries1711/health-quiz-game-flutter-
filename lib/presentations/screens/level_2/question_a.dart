// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/logic/function/global_preferences.dart';
import 'package:game_health_efa/logic/function/helper.dart';
import 'package:game_health_efa/presentations/screens/level_2/question_b.dart';
import 'package:game_health_efa/presentations/widgets/button_general_seconday.dart';
import 'package:game_health_efa/presentations/widgets/card_player.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionATwo extends StatefulWidget {
  final String title;
  QuestionATwo({Key? key, required this.title}) : super(key: key);

  @override
  State<QuestionATwo> createState() => _QuestionATwoState();
}

class _QuestionATwoState extends State<QuestionATwo> {
  HelperFunction helperFunction = HelperFunction();
  GlobalPreferences globalPreferences = GlobalPreferences();
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
  String nameUser = "pemain", genderUser = "Laki-laki";
  int pointUser = 0;
  bool answered = false;

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
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                      child:
                          Image.asset('assets/images/level_b/question_a.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Text(
                        "Jawaban : Luka tertutup\nPenjelasan : Luka adalah jenis cedera yang sering ditemukan. Luka dibagi menjadi dua jenis yaitu : luka tertutup dan luka terbuka. Luka tertutup merupakan kondisi luka dimana kulit tetap dalam keadaan utuh dan jaringan bawahnya tidak langsung terkena dunia luar",
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
                      padding: const EdgeInsets.all(20),
                      child: ButtonGeneralSecondary(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuestionBTwo(
                                title: 'number 2',
                              ),
                            ),
                          );
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
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                      child:
                          Image.asset('assets/images/level_b/question_a.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Text(
                        "Jawaban : Luka tertutup\nPenjelasan : Luka adalah jenis cedera yang sering ditemukan. Luka dibagi menjadi dua jenis yaitu : luka tertutup dan luka terbuka. Luka tertutup merupakan kondisi luka dimana kulit tetap dalam keadaan utuh dan jaringan bawahnya tidak langsung terkena dunia luar",
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
                      padding: const EdgeInsets.all(20),
                      child: ButtonGeneralSecondary(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuestionBTwo(
                                title: 'number 2',
                              ),
                            ),
                          );
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
            ),
          );
        });
      },
    );
  }

  Future<Object> showDialogTimesUp(BuildContext context, Size size) async {
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
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 10),
                      child: Text(
                        "WAKTU HABIS",
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
                      child:
                          Image.asset('assets/images/level_b/question_a.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Text(
                        "Jawaban : Luka tertutup\nPenjelasan : Luka adalah jenis cedera yang sering ditemukan. Luka dibagi menjadi dua jenis yaitu : luka tertutup dan luka terbuka. Luka tertutup merupakan kondisi luka dimana kulit tetap dalam keadaan utuh dan jaringan bawahnya tidak langsung terkena dunia luar",
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
                      padding: const EdgeInsets.all(20),
                      child: ButtonGeneralSecondary(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuestionBTwo(
                                title: 'number 2',
                              ),
                            ),
                          );
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
            ),
          );
        });
      },
    );
  }

  onLoadPage() async {
    String nameUserSave = await globalPreferences.getFullname();
    String genderUserSave = await globalPreferences.getGender();
    setState(() {
      nameUser = nameUserSave;
      genderUser = genderUserSave;
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                              'assets/images/level_b/question_a.png',
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
              child: CardPlayer(
                size: size,
                genderUser: genderUser,
                nameUser: nameUser,
                skorUser: "Skor : $pointUser",
                showTimer: true,
                widgetTimer: Center(
                  child: CountdownTimer(
                    endTime: endTime,
                    onEnd: () async {
                      if (answered == false) {
                        await helperFunction.savePointSpesificLevel("2", 0);
                        showDialogTimesUp(context, size);
                      }
                    },
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return Text('');
                      }
                      return Text(
                        '0${time.min != null ? time.min : "0"}:${time.sec}',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: colorWhite,
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
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
                          "1. Luka seperti gambar di atas disebut?",
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
                          setState(() {
                            answered = true;
                          });
                          helperFunction.savePointSpesificLevel("2", 5);
                          showDialogCorrect(context, size);
                        },
                        backgroundColor: colorPurplePrimary,
                        widgetChild: Text(
                          "Luka tertutup",
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
                          setState(() {
                            answered = true;
                          });
                          showDialogWrong(context, size);
                        },
                        backgroundColor: colorPurplePrimary,
                        widgetChild: Text(
                          "Luka terbuka",
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
                          setState(() {
                            answered = true;
                          });
                          showDialogWrong(context, size);
                        },
                        backgroundColor: colorPurplePrimary,
                        widgetChild: Text(
                          "Luka bakar",
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
      ),
    );
  }
}
