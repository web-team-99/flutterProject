import 'package:flutter/material.dart';

import 'package:test_url/Enums/mainTabsEnum.dart';
import 'package:test_url/Routes/mainScreen.dart';
import 'package:test_url/Setting/router.dart';
import 'package:test_url/Styles/themes.dart';
import 'Configures/configure_nonweb.dart'
    if (dart.library.html) 'Configures/configure_web.dart';

void main() {
  configureApp();
  FluroMainRouter.defineRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme, //Theme for the bot. navbar
      home: MainScreen(
        initialTab: MainTab.home,
      ),
      initialRoute: '/',
      onGenerateRoute: FluroMainRouter.router.generator,
    );
  }
}

//.................... main features to do until 30 Azar, deadline of phase 1: ..........................
//TODO: softWareTeam
//TODO: redundant content when resize screen in more pages bug
//TODO: implement custom error
//TODO: implement image provider and loader
