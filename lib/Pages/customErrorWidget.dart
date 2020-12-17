import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:test_url/Setting/numbers.dart';
import 'package:test_url/Styles/textStyles.dart';

import '../Functions/moreFunctions.dart';
import 'More/blogPost.dart';

class CustomErrorWidget extends StatelessWidget {
  var _pageName;
  var postId;
  CustomErrorWidget(this._pageName, {this.postId});
  @override
  Widget build(BuildContext context) {
    print('post id is');
    print(postId);
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
          IconButton(
            icon: Icon(
              Icons.cached,
              size: _mobileView ? _width / 15 : _width / 25,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              pushNewScreenWithRouteSettings(
                context,
                settings: null,
                screen: postId != null
                    ? BlogPost(postId)
                    : getScreen(
                        _pageName,
                      ),
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            },
          )
        ],
      )),
    );
  }
}

