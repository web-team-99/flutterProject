import 'package:flutter/material.dart';
import 'package:test_url/Setting/numbers.dart';

class WebDesktopHomeImageAndText extends StatelessWidget {
  final String title;
  final String description;
  final String imageAddress;

  WebDesktopHomeImageAndText(this.title, this.description, this.imageAddress);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: _width / 3,
            child: Image.asset(imageAddress),
          ),
          Container(
            width: _width / 3,
            child: Column(
              children: [
                SelectableText(
                  title,
                  style: theme.textTheme.headline2,
                  textDirection: TextDirection.rtl,
                ),
                Divider(
                  height: 10,
                  thickness: 3,
                ),
                SelectableText(
                  description,
                  textDirection: TextDirection.rtl,
                  style: theme.textTheme.headline5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
