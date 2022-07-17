import 'package:flutter/material.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  String title;
  InfoScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorYellowSecondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: size.width,
                height: 180,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorYellowPrimary,
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo-efa.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40, top: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: colorBlackSecondary,
                            fontSize: 24,
                          ),
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Tentang '),
                          TextSpan(
                            text: "E-Fa",
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: colorBlackPrimary,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40, top: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: colorBlackPrimary,
                            fontSize: 18,
                          ),
                        ),
                        children: <TextSpan>[
                          TextSpan(text: '\nHalo kawan semua… \n '),
                          TextSpan(
                            text:
                                "\nPerkenalkan… E-Fa (Education First Aid) merupakan permainan berbasis kuis yang dapat dipelajari kapan saja dan di mana saja menggunakan smartphone. E-Fa Game hadir untuk memudahkan siswa untuk mempelajari konsep pertolongan pertama pada kasus-kasus cedera antara lain : luka, perdarahan dan cedera ekstremitas yang sering kita temui. Diharapkan E-Fa Game dapat dihadikan media edukasi yang menyenangkan untuk meningkatkan pengetahuan pada pertolongan pertama cedera.",
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: colorBlackSecondary,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              Container(
                width: size.width,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Column(
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: colorBlackPrimary,
                              fontSize: 18,
                            ),
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'E-Fa Game dibuat oleh:\n '),
                            TextSpan(
                              text:
                                  "\n1.	Eky Madyaning Nastiti, S.Kep., Ns., M.Kep \n\n2.	Rida Darotin, S.Kep., Ns., M.Kep",
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: colorBlackSecondary,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            TextSpan(text: '\n\nBekerjasama dengan:\n '),
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: size.width * 0.2,
                          child: Image.asset("assets/images/partner1.png"),
                        ),
                        Container(
                          width: size.width * 0.2,
                          child: Image.asset("assets/images/partner2.png"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
