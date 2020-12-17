import 'package:flutter/material.dart';
import 'package:test_url/Setting/numbers.dart';

class CustomErrorWidget extends StatelessWidget {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            margin: EdgeInsets.only(
              top: pagesTopMargin,
              bottom: pagesBottomMargin,
              left: pagesRightAndLeftMargin(_width, _mobileView),
              right: pagesRightAndLeftMargin(_width, _mobileView),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: _width / 7,
                ),
                SelectableText('مشکلی در اتصال به اینترنت پیش آمده است!',
                    textDirection: TextDirection.rtl,
                    style: theme.textTheme.headline2),
                SelectableText(
                    'لطفا از اتصال خود به اینترنت اطمینان حاصل کنید و دوباره امتحان کنید.',
                    textDirection: TextDirection.rtl,
                    style: theme.textTheme.headline5),
                Divider(
                  height: 10,
                  thickness: 3,
                ),
                RaisedButton(
                  child: Text(
                    'بازگشت',
                    style: theme.textTheme.bodyText1,
                    textDirection: TextDirection.rtl,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                // IconButton(
                //   icon: Icon(
                //     Icons.cached,
                //     size: _mobileView ? _width / 15 : _width / 25,
                //   ),
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //     pushNewScreenWithRouteSettings(
                //       context,
                //       settings: null,
                //       screen: postId != null
                //           ? BlogPost(postId)
                //           : getScreen(
                //               _pageName,
                //             ),
                //       pageTransitionAnimation: PageTransitionAnimation.fade,
                //     );
                //   },
                // )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
