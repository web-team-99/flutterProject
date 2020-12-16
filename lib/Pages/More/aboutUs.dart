import 'package:flutter/material.dart';
import 'package:test_url/AppBars/normalAppBar.dart';
import 'package:test_url/Pages/customErrorWidget.dart';
import 'package:test_url/Components/customIndicator.dart';
import 'package:test_url/Components/MoreRoute/moreTextElement.dart';
import 'package:test_url/Setting/numbers.dart';
import 'package:test_url/Setting/strings.dart';
import 'package:test_url/Styles/icons.dart';
import 'package:test_url/providers/MorePageProviders/aboutUsProvider.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatelessWidget {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(aboutUsPageTitle),
        centerTitle: true,
        textTheme: theme.textTheme,
      ),
      backgroundColor: theme.backgroundColor,
      body: FutureBuilder(
          future: Provider.of<AboutUsProvider>(context, listen: false)
              .fetchAboutUs(),
          builder: (ctx, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return CustomIndicator();
            }
            if (snapShot.hasError) {
              return CustomErrorWidget();
            }
            return Scrollbar(
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
                  child: Consumer<AboutUsProvider>(builder: (ctx, d, child) {
                    //print(d.aboutUs[0]['id']);
                    return Column(
                      children: [
                        ...(d.aboutUs as List<Map<String, Object>>).map((item) {
                          return Directionality(
                              textDirection: TextDirection.rtl,
                              child: MoreTextElement(
                                item,
                                'question',
                                'answer',
                                aboutUsIcon,
                              ));
                        }).toList(),
                      ],
                    );
                  }),
                ),
              ),
            );
          }),
    );
  }
}
