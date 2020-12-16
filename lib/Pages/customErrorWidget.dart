import 'package:flutter/material.dart';
import 'package:test_url/Setting/numbers.dart';
import 'package:test_url/Styles/textStyles.dart';

class CustomErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'مجددا تلاش کنید',
            style: TextStyle(
                fontFamily: mainFontFamily,
                fontSize: _mobileView ? _width / 15 : _width / 25),
          ),
          Icon(
            Icons.cached,
            size: _mobileView ? _width / 15 : _width / 25,
          ),
        ],
      )),
    );
  }
}
