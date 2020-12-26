import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:test_url/Components/MoreRoute/moreGridElement.dart';
import 'package:test_url/Enums/moreOptionsEnum.dart';
import 'package:test_url/Functions/moreFunctions.dart';
import 'package:test_url/Pages/More/blog.dart';
import 'package:test_url/Setting/numbers.dart';
import 'package:test_url/Setting/strings.dart';
import 'package:test_url/Styles/animations.dart';
import 'package:test_url/Styles/colors.dart';

class MoreRoute extends StatefulWidget {
  final MoreOption _moreOption;
  final int _blogPostId;

  MoreRoute(this._moreOption, this._blogPostId);

  @override
  _MoreRouteState createState() => _MoreRouteState(_moreOption, _blogPostId);
}

class _MoreRouteState extends State<MoreRoute> {
  final _scrollController = ScrollController();
  final MoreOption _moreOption;
  final int _blogPostId;

  _MoreRouteState(this._moreOption, this._blogPostId);

  @override
  void initState() {
    super.initState();

    if (_moreOption != null) {
      if (_moreOption == MoreOption.blog && _blogPostId != null) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => pushNewScreenWithRouteSettings(
            context,
            settings: null,
            screen: Blog(
              0,
              postId: _blogPostId,
            ),
            pageTransitionAnimation: changePageAnimation,
          ),
        );
      } else {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => pushNewScreenWithRouteSettings(
            context,
            settings: null,
            screen: getScreen(_moreOption),
            pageTransitionAnimation: changePageAnimation,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(morePageTitle),
        centerTitle: true,
        textTheme: theme.textTheme,
      ),
      backgroundColor: theme.backgroundColor,
      body: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: GridView.count(
          controller: _scrollController,
          padding: EdgeInsets.only(
            left: _mobileView ? _width / 7 : _width / 6,
            top: pagesTopMargin,
            right: _mobileView ? _width / 7 : _width / 6,
            bottom: pagesBottomMargin,
          ),
          crossAxisCount: _mobileView ? 2 : 4,
          crossAxisSpacing: _mobileView ? 30.0 : _width / 30,
          mainAxisSpacing: _mobileView ? 10.0 : _width / 30,
          shrinkWrap: true,
          children: [
            ...(MoreOption.values as List<MoreOption>).map((option) {
              return GridElement(option);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
