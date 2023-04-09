import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/wrapper.dart';
import 'package:to_do/utils/theme.dart';
import 'data/datasource/local/database.dart';
import 'pages/home/home_page.dart';

AppDb? db;
void main() {
  
  db = AppDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 792),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: basicThemeData(),
          home: const Wrapper(),
        );
      },
    );
  }
}
