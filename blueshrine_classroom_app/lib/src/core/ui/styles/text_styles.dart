import 'package:flutter/material.dart';

final class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get fontFamily => 'mplus1';

  TextStyle get textLight {
    return TextStyle(fontWeight: FontWeight.w300, fontFamily: fontFamily);
  }

  TextStyle get textRegular {
    return TextStyle(fontWeight: FontWeight.normal, fontFamily: fontFamily);
  }

  TextStyle get textMedium {
    return TextStyle(fontWeight: FontWeight.w500, fontFamily: fontFamily);
  }

  TextStyle get textSemiBold {
    return TextStyle(fontWeight: FontWeight.w600, fontFamily: fontFamily);
  }

  TextStyle get textBold {
    return TextStyle(fontWeight: FontWeight.bold, fontFamily: fontFamily);
  }

  TextStyle get textExtraBold {
    return TextStyle(fontWeight: FontWeight.w800, fontFamily: fontFamily);
  }

  TextStyle get textTitle => textExtraBold.copyWith(fontSize: 20);
  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
