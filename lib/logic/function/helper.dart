import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/logic/function/global_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class HelperFunction {
  GlobalPreferences globalPreferences = GlobalPreferences();

  toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        fontSize: 16.0,
        backgroundColor: colorBlackPrimary);
  }

  launchUrlExternal(Uri linkUrl) async {
    if (!await launchUrl(
      linkUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $linkUrl';
    }
  }

  explodeMonthText(String valueMonth) {
    if (valueMonth == "01") {
      return "Januari";
    } else if (valueMonth == "02") {
      return "Februari";
    } else if (valueMonth == "03") {
      return "Maret";
    } else if (valueMonth == "04") {
      return "April";
    } else if (valueMonth == "05") {
      return "Mei";
    } else if (valueMonth == "06") {
      return "Juni";
    } else if (valueMonth == "07") {
      return "Juli";
    } else if (valueMonth == "08") {
      return "Agustus";
    } else if (valueMonth == "09") {
      return "September";
    } else if (valueMonth == "10") {
      return "Oktober";
    } else if (valueMonth == "11") {
      return "November";
    } else if (valueMonth == "12") {
      return "Desember";
    } else {
      return "invalid month";
    }
  }

  savePointSpesificLevel(String skorLevel, int value) async {
    if (skorLevel == "1") {
      int getValueLevelNow = await globalPreferences.getScoreLevelOne();
      if (getValueLevelNow == null) {
        getValueLevelNow = 0;
      }
      int scoreAccumulated = getValueLevelNow + value;
      await globalPreferences.saveScoreLevelOne(scoreAccumulated);
    } else if (skorLevel == "2") {
      int getValueLevelNow = await globalPreferences.getScoreLevelTwo();
      if (getValueLevelNow == null) {
        getValueLevelNow = 0;
      }
      int scoreAccumulated = getValueLevelNow + value;
      await globalPreferences.saveScoreLevelTwo(scoreAccumulated);
    } else if (skorLevel == "3") {
      int getValueLevelNow = await globalPreferences.getScoreLevelThree();
      if (getValueLevelNow == null) {
        getValueLevelNow = 0;
      }
      int scoreAccumulated = getValueLevelNow + value;
      await globalPreferences.saveScoreLevelThree(scoreAccumulated);
    }
  }

  Future<void> showQuitValidation(
      BuildContext context, String messageDialog) async {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (bsContext) {
          return Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.transparent,
              ),
              child: Container(
                width: size.width,
                height: size.height * 2.2,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 25, bottom: 15),
                        height: 5,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          color: colorPurplePrimary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        messageDialog,
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF5A6764),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: size.width * 0.4,
                            height: size.height * 0.05,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: colorPurplePrimary),
                            child: InkWell(
                              child: Center(
                                child: Text('Batalkan',
                                    style: GoogleFonts.rubik(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: colorWhite)),
                              ),
                              onTap: () async {
                                Navigator.pop(bsContext);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: size.width * 0.3,
                        height: size.height * 0.05,
                        child: InkWell(
                          child: Center(
                            child: Text('Keluar',
                                style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: colorGrey)),
                          ),
                          onTap: () async {
                            SystemNavigator.pop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
