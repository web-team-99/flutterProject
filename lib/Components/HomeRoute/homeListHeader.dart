import 'package:flutter/material.dart';

class HomeListHeader extends StatelessWidget {
  final String title;
  final Function buttonFunction;

  HomeListHeader(this.title, this.buttonFunction);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton(
              child: Center(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    'بیشتر',
                    style: theme.textTheme.bodyText1,
                    textDirection: TextDirection.rtl,
                  )
                ],
              )),
              onPressed: buttonFunction,
            ),
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: theme.textTheme.headline5,
            )
          ],
        ),
        Divider(
          height: 10,
          thickness: 3,
        ),
      ],
    );
  }
}
