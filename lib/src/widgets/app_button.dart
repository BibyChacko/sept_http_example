
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_theme.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AppButton({required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(primary: AppColors.primaryColor),
        child: Text(
          title,
          style: AppTextTheme.buttonTextStyle,
        ));
  }
}
