// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:game_health_efa/presentations/widgets/button_general.dart';
import 'package:game_health_efa/presentations/widgets/input_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class BiodataScreen extends StatefulWidget {
  final String title;
  BiodataScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  TextEditingController fullnameController = TextEditingController();
  String errorFullnameMessage = "", errorMessageBirthday = "";

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
                    onTap: () {},
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
                          "Masukkan tanggal lahir",
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
                    onTap: () {},
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
                          "Pilih jenis kelamin",
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
