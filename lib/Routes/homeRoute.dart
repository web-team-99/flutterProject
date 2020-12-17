import 'package:flutter/material.dart';
import 'package:test_url/Components/CustomRaisedButton.dart';
import 'package:test_url/Components/HomeRoute/ProjectAndServiceSuggest.dart';
import 'package:test_url/Components/HomeRoute/homeListHeader.dart';
import 'package:test_url/Components/HomeRoute/webDesktopHomeFooter.dart';
import 'package:test_url/Components/HomeRoute/webDesktopHomeImageAndText.dart';
import 'package:test_url/Components/HomeRoute/webMobileHomeFooter.dart';
import 'package:test_url/Components/HomeRoute/webMobileHomeImageAndText.dart';
import 'package:test_url/Setting/numbers.dart';
import 'package:test_url/Setting/strings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  final _scrollController = ScrollController();
  int _state = 0;

  changeState() {
    setState(() {
      if (_state == 0) {
        _state = 1;
      } else {
        _state = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Scaffold(
        appBar: kIsWeb
            ? AppBar(
                actions: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CustomRaisedButton(
                      title: homePageAppBarInstallApp,
                      onPressed: () => {
                        //TODO
                      },
                    ),
                  )
                ],
                title: Text(homePageAppBarTitle),
                centerTitle: true,
                textTheme: theme.textTheme,
              )
            : AppBar(
                title: Text(homePageAppBarTitle),
                centerTitle: true,
                textTheme: theme.textTheme,
              ),
        backgroundColor: theme.backgroundColor,
        body: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: pagesTopMargin,
                bottom: pagesBottomMargin,
                left: homePageRightAndLeftMargin(_width, _mobileView),
                right: homePageRightAndLeftMargin(_width, _mobileView),
              ),
              child: Column(
                children: [
                  kIsWeb
                      ? _mobileView
                          ? WebMobileHomeImageAndText(
                              homeFirstStringTitle,
                              homeFirstStringDescription,
                              'assets/homeOne.png',
                            )
                          : WebDesktopHomeImageAndText(
                              homeFirstStringTitle,
                              homeFirstStringDescription,
                              'assets/homeOne.png',
                            )
                      : SizedBox.shrink(),
                  kIsWeb
                      ? _mobileView
                          ? WebMobileHomeImageAndText(
                              homeSecondStringTitle,
                              homeSecondStringDescription,
                              'assets/homeTwo.png',
                            )
                          : WebDesktopHomeImageAndText(
                              homeSecondStringTitle,
                              homeSecondStringDescription,
                              'assets/homeTwo.png',
                            )
                      : SizedBox.shrink(),
                  HomeListHeader(
                    'پروژه‌ها',
                    () => {
                      //TODO
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: _mobileView
                        ? (100 + 15) as double
                        : (160 + 15) as double,
                    // width: _width / 7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) =>
                          ProjectAndServiceSuggest(
                        'http://138.201.6.240:8001/media/blog_photos/increase-virgool.jpg',
                        30000,
                        'نمونه پروژه',
                      ),
                    ),
                  ),
                  HomeListHeader(
                    'سرویس‌ها',
                    () => {
                      //TODO
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: _mobileView
                        ? (100 + 15) as double
                        : (160 + 15) as double,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) =>
                          ProjectAndServiceSuggest(
                        'http://138.201.6.240:8001/media/blog_photos/omid4.jpg',
                        10000,
                        'نمونه سرویس',
                      ),
                    ),
                  ),
                  // kIsWeb
                  //     ? Divider(
                  //         height: 100,
                  //         thickness: 3,
                  //       )
                  //     : SizedBox.shrink(),
                  kIsWeb
                      ? _mobileView
                          ? WebMobileHomeFooter()
                          : WebDesktopHomeFooter()
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ));
  }
}
