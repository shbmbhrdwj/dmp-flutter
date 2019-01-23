import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/icon_data.dart';

IconData getIconData(String iconCode, String iconStyle) {
  IconData iconData;
  int codePoint = getHexForIconCode(iconCode);
  switch (iconStyle) {
    case 'solid':
      iconData = IconDataSolid(codePoint);
      break;
    case 'brand':
      iconData = IconDataBrands(codePoint);
      break;
    default:
      iconData = IconDataRegular(codePoint);
  }
  return iconData;
}

int getHexForIconCode(String iconCode) {
  return int.parse(iconCode, radix: 16);
}
