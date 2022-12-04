import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color colorInk100 = Color(0xfff5f5f6);
  static const Color colorInk200 = Color(0xffeaeced);
  static const Color colorInk300 = Color(0xffc0c5cb);
  static const Color colorInk350 = Color(0xff969fa7);
  static const Color colorInk400 = Color(0xff566573);
  static const Color colorInk500 = Color(0xff2c3e50);

  static const Color colorBrandR300 = Color(0xfffef4f4);
  static const Color colorBrandR400 = Color(0xfffde9e9);
  static const Color colorBrandR500 = Color(0xfff9bdbe);
  static const Color colorBrandR600 = Color(0xffef4e52);
  static const Color colorBrandR700 = Color(0xffeb2227);
  static const Color colorBrandR800 = Color(0xffcf1a1e);

  static const Color colorBrand300 = Color(0xfff4f8f7);
  static const Color colorBrand400 = Color(0xffe9f2ee);
  static const Color colorBrand500 = Color(0xffbdd7cc);
  static const Color colorBrand600 = Color(0xff4d9578);
  static const Color colorBrand700 = Color(0xff217b56);

  static const Color colorBrand800 = Color(0xff066132);

  static const Color colorBlack100 = Color(0xfff4f4f4);
  static const Color colorBlack200 = Color(0xffe8e8e8);
  static const Color colorBlack300 = Color(0xffbababa);
  static const Color colorBlack350 = Color(0xff8c8c8c);
  static const Color colorBlack400 = Color(0xff474747);
  static const Color colorBlack500 = Color(0xff191919);

  static const Color colorWhite = Color(0xffffffff);

  static const Color colorBlue100 = Color(0xfff4f9fe);
  static const Color colorBlue200 = Color(0xffe9f4fd);
  static const Color colorBlue300 = Color(0xffbdddf9);
  static const Color colorBlue400 = Color(0xff4ea5ef);
  static const Color colorBlue500 = Color(0xff228eeb);

  static const Color colorOrange100 = Color(0xfffef7f4);
  static const Color colorOrange200 = Color(0xfffdefe9);
  static const Color colorOrange300 = Color(0xfff9d1bd);
  static const Color colorOrange400 = Color(0xffef834e);
  static const Color colorOrange500 = Color(0xffeb6422);

  static const Color colorGreen100 = Color(0xfff4fef6);
  static const Color colorGreen200 = Color(0xffe9fded);
  static const Color colorGreen300 = Color(0xffbdf9ca);
  static const Color colorGreen400 = Color(0xff34c072);
  static const Color colorGreen500 = Color(0xff36ae7c);

  static const Color colorRed100 = Color(0xfffef6f6);
  static const Color colorRed200 = Color(0xfffdeeee);
  static const Color colorRed300 = Color(0xfff9cbcb);
  static const Color colorRed400 = Color(0xffef7575);
  static const Color colorRed500 = Color(0xffeb5353);

  static const Color colorYellow = Color(0xffffe500);

  static const double fontSize16 = 16;
  static const double fontSize18 = 18;
  static const double fontSize14 = 14;
  static const double fontSize12 = 12;
  static const double fontSize10 = 10;
  static const double fontSize20 = 20;

  static const Border bottomLine200 = Border(
    bottom: BorderSide(
      width: 1,
      color: colorInk200,
    ),
  );

  static const Border topLine200 = Border(
    top: BorderSide(
      width: 1,
      color: colorInk200,
    ),
  );

  static final boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    color: AppTheme.colorWhite,
  );

  static const Border borderTopLine = Border(
    top: BorderSide(
      width: 1,
      color: colorInk200,
    ),
  );

  static final boxShadow = [
    BoxShadow(
      offset: const Offset(0.0, 2.0),
      color: Colors.black.withOpacity(.2),
      blurRadius: 10.0,
    ),
  ];

  static final shadow4 = [
    BoxShadow(
      offset: const Offset(0.0, 2.0),
      color: Colors.black.withOpacity(.1),
      blurRadius: 4.0,
    ),
  ];

  static final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  static final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  static final ButtonStyle roundUnactiveButton = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.all(15),
    ),
    backgroundColor: MaterialStateProperty.all(colorInk100),
  );
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
