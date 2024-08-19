import 'package:comic_book/presentation/tokens/theme_colors.dart';
import 'package:flutter/material.dart';


class AppTheme {

  final bool isDarkmode;

  AppTheme({ required this.isDarkmode });


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: ThemeColors.whiteColor,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,

    listTileTheme: const ListTileThemeData(
      iconColor:  ThemeColors.whiteColor,
    ),
    
  );

}