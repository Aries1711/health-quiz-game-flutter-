import 'package:fluttertoast/fluttertoast.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunction {
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
}
