import 'package:flutter/material.dart';
import 'package:test_url/AppBars/normalAppBar.dart';
import 'package:test_url/Components/MoreRoute/manualWidget.dart';
import 'package:test_url/Setting/numbers.dart';
import 'package:test_url/Setting/strings.dart';
import 'package:provider/provider.dart';
import '../customErrorWidget.dart';
import '../../Components/customIndicator.dart';
import '../../providers/MorePageProviders/manualProvider.dart';

class Manual extends StatelessWidget {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(manualPageTitle),
        centerTitle: true,
        textTheme: theme.textTheme,
      ),
      backgroundColor: theme.backgroundColor,
      body: FutureBuilder(
          future:
              Provider.of<ManualProvider>(context, listen: false).fetchManual(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomIndicator();
            }
            if (snapshot.hasError) {
              return CustomErrorWidget();
            }
            return Consumer<ManualProvider>(
              builder: (context, data, child) => Scrollbar(
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
                    child: Column(
                      children: [
                        ...data.manuals.map((e) => ManualWidget(
                              manualModel: e,
                            ))
                      ].toList(),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
