import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../tokens/theme_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.appBarColor, required this.goBack});
  
  final Widget title;
  final Color? appBarColor;
  final bool goBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: title
      /* Text(
        title,
        style: TextStyle(
          color: appBarColor != null ? ThemeColors.whiteColor : ThemeColors.blackColor
        ),
      ) */,
      centerTitle: true,
      backgroundColor: appBarColor ?? ThemeColors.whiteColor,
      elevation: 4.0,
      leading: goBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: ()=> context.go('/'),
              color: ThemeColors.whiteColor,
            ) 
          : null,
    );
  }
}
