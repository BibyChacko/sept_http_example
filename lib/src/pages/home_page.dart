import 'package:flutter/material.dart';

import '../theme/app_text_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: AppTextTheme.h6Style,
        ),
      ),
      body: const Center(child: Text("Home page")),
    );
  }
}
