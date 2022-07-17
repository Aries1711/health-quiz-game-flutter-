import 'package:fluttertoast/fluttertoast.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/logic/function/global_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
}
