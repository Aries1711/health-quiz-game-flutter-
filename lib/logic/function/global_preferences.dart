import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalPreferences {
  resetData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  saveFullname(String fullname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fullnameUser", fullname);
  }

  getFullname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("fullnameUser");
  }

  saveBirthdate(String birthdate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("birthdateUser", birthdate);
  }

  getBirthdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("birthdateUser");
  }

  saveGender(String gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("genderUser", gender);
  }

  getGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("genderUser");
  }

  saveLevelOpen(int level) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("levelOpenUser", level);
  }

  getLevelOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("levelOpenUser");
  }

  saveScoreLevelOne(int scoreOne) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("scoreLevelOne", scoreOne);
  }

  getScoreLevelOne() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("scoreLevelOne");
  }

  saveScoreLevelTwo(int scoreOne) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("scoreLevelTwo", scoreOne);
  }

  getScoreLevelTwo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("scoreLevelTwo");
  }

  saveScoreLevelThree(int scoreOne) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("scoreLevelThree", scoreOne);
  }

  getScoreLevelThree() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("scoreLevelThree");
  }
}
