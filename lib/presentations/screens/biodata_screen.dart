// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/logic/function/global_preferences.dart';
import 'package:game_health_efa/logic/function/helper.dart';
import 'package:game_health_efa/presentations/widgets/button_general.dart';
import 'package:game_health_efa/presentations/widgets/custom_date_picker.dart';
import 'package:game_health_efa/presentations/widgets/input_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BiodataScreen extends StatefulWidget {
  final String title;
  BiodataScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  TextEditingController fullnameController = TextEditingController();
  String errorFullnameMessage = "", errorMessageBirthday = "";
  GlobalPreferences globalPreferences = GlobalPreferences();
  HelperFunction helperFunction = HelperFunction();
  DateTime? pickedDate;
  String? birthDatePick, birthMonthPick, birthYearPick, birthDateToPost;
  String birthDateText = "empty", chooseGenderString = "Laki-laki";
  int chooseGender = 0;

  _pickDate() async {
    DateTime? date = await myCustomDatePicker(
      context: context,
      initialDate: pickedDate!,
      firstDate: DateTime(DateTime.now().year - 200),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
        birthDatePick = DateFormat('dd').format(pickedDate!);
        birthMonthPick = helperFunction
            .explodeMonthText(DateFormat('MM').format(pickedDate!));
        birthYearPick = DateFormat('yyyy').format(pickedDate!);
        birthDateText = "$birthDatePick $birthMonthPick $birthYearPick";
        birthDateToPost = DateFormat('yyyy-MM-dd').format(pickedDate!);
        debugPrint(birthDateToPost);
        debugPrint("ini tanggal text format $birthDateText");
      });
    }
  }

  showDropdownMethod(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter myState) {
            return FractionallySizedBox(
              heightFactor: 0.4,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: colorWhite),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          padding: EdgeInsets.only(top: 30, bottom: 30),
                          width: size.width,
                          decoration: BoxDecoration(
                              color: colorWhite,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: size.width * 0.25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 100,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: colorGrey,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Selesai",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: colorPurplePrimary,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * 0.2,
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 30),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 65,
                                  onSelectedItemChanged: (int index) {
                                    setState(() {
                                      chooseGender = index;
                                      debugPrint(
                                          " ini index method $chooseGender");
                                      if (index == 1) {
                                        chooseGenderString = "Perempuan";
                                      } else {
                                        chooseGenderString = "Laki-laki";
                                      }
                                    });
                                  },
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Pilih Jenis Kelamin",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.rubik(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: colorPurplePrimary,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Laki-laki",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.rubik(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: colorPurplePrimary,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Perempuan",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.rubik(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: colorPurplePrimary,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime(DateTime.now().year - 40);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorYellowPrimary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 80),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome to Quis Game",
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
              padding: EdgeInsets.only(),
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
              margin: EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/logo-men.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: InputTextField(
                        hintText: "Masukkan nama",
                        onChanged: (value) {},
                        errorMessage: "",
                        errorEmptyMessage: errorFullnameMessage,
                        typeWriter: TextInputType.text,
                        textController: fullnameController),
                  ),
                  InkWell(
                    onTap: () => _pickDate(),
                    child: Container(
                      width: size.width,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: colorGreySoft,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          birthDateText == "empty"
                              ? "Masukkan tanggal lahir"
                              : birthDateText,
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
                  ),
                  InkWell(
                    onTap: () => showDropdownMethod(context),
                    child: Container(
                      width: size.width,
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: colorGreySoft,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          chooseGender == 0
                              ? "Pilih jenis kelamin"
                              : chooseGenderString,
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Masukkin data diri dengan benar ya biar kita makin kenal",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: colorPurplePrimary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 140, bottom: 20, left: 20, right: 20),
                    child: ButtonGeneral(
                        onPress: () {
                          Navigator.of(context).pushNamed('/level');
                        },
                        backgroundColor: colorPurplePrimary,
                        widgetChild: Text(
                          "Selanjutnya",
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: colorWhite,
                              fontSize: 22,
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
  }
}
