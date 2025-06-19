import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';

import 'features/others/presentation/screens/my_qr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      title: 'Flutter Demo',
      home: MyQr(),
    );
  }
}
