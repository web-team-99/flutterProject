import 'package:flutter/material.dart';
import 'package:test_url/Styles/colors.dart';
import 'package:test_url/Styles/textStyles.dart';

class NormalAppBar extends StatelessWidget {
  final String _title;
  final bool _activeBackButton;

  NormalAppBar(this._title, this._activeBackButton);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.appBarTheme.color,
        boxShadow: [
          BoxShadow(
              offset: Offset(0.0, 2.0),
              color: theme.appBarTheme.shadowColor,
              blurRadius: 5.0),
        ],
      ),
      // color: Theme.of(context).appBarTheme.color,
      width: double.infinity,
      height: 80,
      child: Column(
        children: [
          Expanded(
            child: SizedBox.shrink(),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                _activeBackButton
                    ? Container(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      )
                    : SizedBox.shrink(),
                Expanded(
                  child: Center(
                    child: Text(
                      _title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: mainFontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                _activeBackButton
                    ? Container(
                        width: 40,
                        height: 40,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
