import 'package:flutter/material.dart';

// colors
Color primaryColor = const Color(0xFF009AAD);
Color secondaryColor = const Color(0xFFC3C3C3);
Color blackColor = const Color(0xFF2E2E2E);
Color whiteColor = const Color(0xFFF6F6F6);
Color greyColor = const Color(0xFFDFDFDF);

// shadow
List<BoxShadow> boxShadow(double offset) => [
      BoxShadow(
        offset: Offset(0, offset),
        blurRadius: 8,
        spreadRadius: -1,
        color: const Color(0x352E2E2E),
      )
    ];

// fonts
TextStyle boldText(double font) => TextStyle(
      color: blackColor,
      fontWeight: FontWeight.w700,
      fontSize: font,
    );

TextStyle regularText(double font) => TextStyle(
      color: blackColor,
      fontWeight: FontWeight.w500,
      fontSize: font,
    );

TextStyle lightText(double font) => TextStyle(
      color: blackColor,
      fontWeight: FontWeight.w300,
      fontSize: font,
    );

TextStyle primaryText(double font) => TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w700,
      fontSize: font,
    );