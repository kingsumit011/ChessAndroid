import 'dart:async';

import 'package:chess/constants/assets.dart';
import 'package:chess/widgets/app_icon_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/Navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child: AppIconWidget(image: Assets.appLogo)),
    );
  }

  startTimer() {
    var _duration = const Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
/*    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(Preferences.is_logged_in) ?? false) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }*/

    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed(Routes.login);
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      }
    });
  }
}
