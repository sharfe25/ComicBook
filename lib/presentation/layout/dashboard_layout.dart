import 'package:flutter/material.dart';

import '../tokens/theme_colors.dart';
import '../widgets/custom_app_bar.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout(
      {super.key,
      required this.body,
      required this.title,
      this.padding,
      this.appBarColor,
      this.goBack = false});
  final Widget title;
  final Widget body;
  final double? padding;
  final Color? appBarColor;
  final bool goBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundGrayColor,
      appBar:
          CustomAppBar(title: title, appBarColor: appBarColor, goBack: goBack),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
        child: body,
      ),
    );
  }
}
