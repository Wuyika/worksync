import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
GlobalKey<ScaffoldMessengerState>();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

final List<Locale> languages = [
  const Locale('en'),
  const Locale('fr'),
];

const String clockIn = "CLOCK-IN";
const String clockOut = "CLOCK-OUT";
