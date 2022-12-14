import 'package:flutter/material.dart';
import 'package:myactivity_project/ramayana_home.dart';
import 'package:myactivity_project/profile.dart';
import 'package:myactivity_project/ramayana_print.dart';
import 'package:myactivity_project/ramayana_history.dart';
import 'package:myactivity_project/ramayana_signup.dart';
import 'package:myactivity_project/ramayana_user.dart';
import 'package:myactivity_project/ramayana_history.dart';
import 'package:myactivity_project/ramayana_activity.dart';
import 'package:myactivity_project/ramayana_home.dart';
import 'package:myactivity_project/ramayana_login.dart';
import 'package:myactivity_project/ramayana_profile.dart';
import 'package:myactivity_project/ramayana_void.dart';
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:myactivity_project/shopping.dart';
import 'db.dart';


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
        ResponsiveBreakpoint.autoScale(600, name : PHONE),
        ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ResponsiveBreakpoint.autoScale(600, name : DESKTOP),
      ],
    ),
        title: 'Tugas Flutter',
        debugShowCheckedModeBanner: false,
        home:  Ramayana());
  }
}



