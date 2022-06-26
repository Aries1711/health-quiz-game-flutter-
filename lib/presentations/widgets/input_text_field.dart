// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_health_efa/constant/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextField extends StatelessWidget {
  final String errorMessage;
  final String errorEmptyMessage;
  final TextInputType typeWriter;
  final TextEditingController textController;
  final String hintText;
  final ValueChanged<String> onChanged;

  const InputTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.errorMessage,
    required this.errorEmptyMessage,
    required this.typeWriter,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: colorGreySoft,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TextFormField(
            keyboardType: typeWriter,
            onSaved: (value) {},
            onChanged: onChanged,
            validator: (String? value) {
              if (value == null || value == "") {
                return errorEmptyMessage;
              }
              if (errorMessage != "") {
                return errorMessage;
              }
            },
            controller: textController,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0XFF1A1919),
            ),
            decoration: InputDecoration(
              errorText: errorMessage != "" ? errorMessage : null,
              errorStyle: TextStyle(
                color: Color(0XFFdc3545),
                fontSize: 12,
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: colorBlackSecondary,
                  fontSize: 16,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
          Visibility(
            visible: errorEmptyMessage != '',
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 10),
                  child: Icon(
                    Icons.info_outline_rounded,
                    size: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      errorEmptyMessage,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: colorOrange,
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
    );
  }
}
