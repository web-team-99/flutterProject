import 'package:flutter/material.dart';
import 'package:test_url/AppBars/normalAppBar.dart';
import 'package:test_url/Setting/numbers.dart';
import 'package:test_url/Setting/strings.dart';
import 'package:test_url/Styles/colors.dart';

//....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!
//this is just a template for creating new pages
//we never use this class in our code
//....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!

class ScreenTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return Container(
      color: backgroundColor,
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: appBarHeight + pagesTopMargin,
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                bottom: pagesBottomMargin,
                left: pagesRightAndLeftMargin(_width, _mobileView),
                right: pagesRightAndLeftMargin(_width, _mobileView),
              ),
              child: Column(
                children: [
                  Text('this is just a template for creating new pages.'),
                  Text('never use this class!'),
                  Text(
                      'for create new pages, don\'t rermove Container/Stack/Container classes.'),
                  Text('these are necessary for appbar'),
                  Text('also don\'t edit color and margin'),
                  Text(
                      'don\'t forget to add page title in strings and edit NormalAppBar arguments'),
                ],
              ),
            ),
          ),
        ),
        NormalAppBar(templatePageTitle, true),
      ]),
    );
  }
}
