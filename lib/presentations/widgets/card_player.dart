// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPlayer extends StatelessWidget {
  final bool showTimer;
  final String skorUser, nameUser, genderUser;
  final Widget widgetTimer;

  CardPlayer({
    Key? key,
    required this.size,
    required this.showTimer,
    required this.skorUser,
    required this.nameUser,
    required this.genderUser,
    required this.widgetTimer,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorWhite,
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    genderUser == "Laki-laki"
                        ? "assets/images/logo-men.png"
                        : "assets/images/logo-women.png",
                    height: 45,
                  ),
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
                                fontSize: 16,
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
                            skorUser,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: colorBlackSecondary,
                                fontSize: 12,
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
          Positioned(
            right: 0,
            child: Visibility(
              visible: showTimer,
              child: Container(
                width: 100,
                height: 65,
                decoration: BoxDecoration(
                  color: colorOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: widgetTimer,
              ),
            ),
          )
        ],
      ),
    );
  }
}
