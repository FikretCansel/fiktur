import 'dart:convert';

import 'package:fiktur/pages/root_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'FikTur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
        //   bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        // ),
      ),
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}