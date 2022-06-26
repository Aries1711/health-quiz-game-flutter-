import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalPreferences {
  saveFullname(String fullname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fullnameUser", fullname);
  }

  getFullname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("fullnameUser");
  }
}
