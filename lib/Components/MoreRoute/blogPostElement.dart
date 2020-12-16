import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:test_url/Components/CustomRaisedButton.dart';
import 'package:test_url/Pages/More/blogPost.dart';
import 'package:test_url/Setting/numbers.dart';
import 'package:test_url/Styles/textStyles.dart';

class BlogPostElement extends StatelessWidget {
  final int _postId;
  final String _imageUrl;
  final String _title;
  final String _date;
  final String _time;

  BlogPostElement(
      this._postId, this._title, this._imageUrl, this._date, this._time);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      color: Colors.white,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              // height: _width / 4,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  _imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _time,
                          textDirection: TextDirection.rtl,
                          style: theme.textTheme.subtitle1,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.access_time,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _date,
                          textDirection: TextDirection.rtl,
                          style: theme.textTheme.subtitle1,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.calendar_today,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: SelectableText(
                    _title,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: mainFontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // InkWell(
                    //   child: Card(
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(color: Colors.black, width: 2),
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //     color: themeColor,
                    //     child: Container(
                    //         margin: EdgeInsets.all(10),
                    //         child: Text(
                    //           'ادامه مطلب',
                    //           textDirection: TextDirection.rtl,
                    //           style: TextStyle(fontFamily: mainFontFamily),
                    //         )),
                    //   ),
                    //   onTap: () => {
                    //     pushNewScreenWithRouteSettings(
                    //       context,
                    //       settings: null,
                    //       screen: BlogPost(_postId),
                    //       pageTransitionAnimation: PageTransitionAnimation.fade,
                    //     ),
                    //   },
                    // ),
                    CustomRaisedButton(
                      onPressed: () => {
                        pushNewScreenWithRouteSettings(
                          context,
                          settings: null,
                          screen: BlogPost(_postId),
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        )
                      },
                      title: 'ادامه مطلب',
                      isDisabled: false,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
