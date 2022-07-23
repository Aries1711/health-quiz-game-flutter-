// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/logic/function/global_preferences.dart';
import 'package:game_health_efa/logic/function/helper.dart';
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
  String nameUser = "", genderUser = "", birthdateUser = "";
  int levelUserOpen = 0;

  Future<Object> showDialogStart(
      BuildContext context, Size size, int levelChoose) async {
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
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Level $levelChoose",
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
                            (() {
                              if (levelChoose == 1) {
                                return "Mudah banget";
                              } else if (levelChoose == 2) {
                                return "Hura huru";
                              } else {
                                return "Senam jantung";
                              }
                            }()),
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
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      (() {
                        if (levelChoose == 1) {
                          return "Berisikan 8 pertanyaan dengan ketentuan (skor benar 5, salah 0, tanpa batas waktu)";
                        } else if (levelChoose == 2) {
                          return "Berisikan 7 pertanyaan dengan ketentuan (skor benar 5, salah 0, dengan batas waktu 60 detik)";
                        } else {
                          return "Berisikan 7 pertanyaan dengan ketentuan (skor benar 5, salah -1, bila melewati batas menjawab 60 detik / salah skor -1)";
                        }
                      }()),
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
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                              onPress: () async {
                                if (levelChoose == 1) {
                                  await globalPreferences.saveScoreLevelOne(0);
                                  Navigator.of(context)
                                      .pushNamed('/level_a/question_a');
                                } else if (levelChoose == 2) {
                                  await globalPreferences.saveScoreLevelTwo(0);
                                  Navigator.of(context)
                                      .pushNamed('/level_b/question_a');
                                } else {
                                  await globalPreferences
                                      .saveScoreLevelThree(0);
                                  Navigator.of(context)
                                      .pushNamed('/level_c/question_a');
                                }
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

  Future<Object> showDialogInfo(BuildContext context) async {
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
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Info Game",
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
                            "Baca dengan teliti",
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
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Dalam permainan game E-Fa pemain harus menyelesaikan setiap level dengan skor kelulusan maksimum untuk bisa lanjut memilih level selanjutnya",
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
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      "Sssstttt peraturan di setiap level berbeda pastikan Anda benar-benar sudah siap",
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
                    child: ButtonGeneralSecondary(
                        onPress: () {
                          Navigator.pop(context);
                        },
                        backgroundColor: colorGrey,
                        widgetChild: Text(
                          "Tutup",
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: colorBlackSecondary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        textColor: colorWhite),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

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

  onLoadPage() async {
    String nameUserString = await globalPreferences.getFullname();
    String birthdateUserString = await globalPreferences.getBirthdate();
    String genderUserString = await globalPreferences.getGender();
    int levelOpenInt = await globalPreferences.getLevelOpen();

    setState(() {
      nameUser = nameUserString;
      birthdateUser = birthdateUserString;
      genderUser = genderUserString;
      levelUserOpen = levelOpenInt;
    });
  }

  @override
  void initState() {
    onLoadPage();
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
                    child: Image.asset(genderUser == "Laki-laki"
                        ? "assets/images/logo-men.png"
                        : "assets/images/logo-women.png"),
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
                              nameUser,
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
                              birthdateUser,
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
            InkWell(
              onTap: () {
                showDialogInfo(context);
              },
              child: Container(
                width: size.width,
                height: 60,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, top: 20, right: 20, bottom: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Aturan main E-Fa",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                    Icon(
                      Icons.info,
                      color: colorOrange,
                      size: 30,
                    )
                  ],
                ),
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
              backgroundColor: levelUserOpen > 0 ? colorWhite : colorGrey,
              onPress: () {
                showDialogStart(context, size, 1);
              },
            ),
            CardLevel(
              size: size,
              textLevel: "Level 2",
              textSubtitle: "Yang bikin terburu-buru",
              backgroundColor: levelUserOpen > 1 ? colorWhite : colorGrey,
              onPress: () {
                if (levelUserOpen > 1) {
                  showDialogStart(context, size, 2);
                } else {
                  helperFunction
                      .toastMessage("Maaf belum bisa pilih level ini");
                }
              },
            ),
            CardLevel(
              size: size,
              textLevel: "Level 3",
              textSubtitle: "Senam jantung yuk",
              backgroundColor: levelUserOpen > 2 ? colorWhite : colorGrey,
              onPress: () {
                if (levelUserOpen > 2) {
                  showDialogStart(context, size, 3);
                } else {
                  helperFunction
                      .toastMessage("Maaf belum bisa pilih level ini");
                }
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
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
            )
          ],
        ),
      ),
    );
  }
}
