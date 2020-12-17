import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:test_url/Enums/homeOptionsEnum.dart';
import 'package:test_url/Enums/mainTabsEnum.dart';
import 'package:test_url/Enums/moreOptionsEnum.dart';
import 'package:test_url/Functions/mainFunctions.dart';
import 'package:test_url/Routes/homeRoute.dart';
import 'package:test_url/Routes/messagesRoute.dart';
import 'package:test_url/Routes/moreRoute.dart';
import 'package:test_url/Routes/profileRoute.dart';
import 'package:test_url/Routes/searchRoute.dart';
import 'package:test_url/Setting/numbers.dart';
import 'package:test_url/Setting/strings.dart';
import 'package:test_url/Styles/icons.dart';
import 'package:test_url/Styles/textStyles.dart';
import 'package:test_url/Styles/themes.dart';
import 'package:test_url/providers/MorePageProviders/aboutUsProvider.dart';
import 'package:test_url/providers/MorePageProviders/blogPostProvider.dart';
import 'package:test_url/providers/MorePageProviders/blogProvider.dart';
import 'package:test_url/providers/MorePageProviders/contactUsProvider.dart';
import 'package:test_url/providers/MorePageProviders/faqProvider.dart';
import 'package:test_url/providers/MorePageProviders/manualProvider.dart';
import 'package:test_url/providers/MorePageProviders/pricingProvider.dart';
import 'package:test_url/providers/MorePageProviders/rulesProvider.dart';
import 'package:provider/provider.dart';

// this is main page. main page is fullscreen page contains bottom navigation bar.
// so the contents of this file, is setting of the Persistent_nav_bar package.
// we use initialTab (is necessary), moreOption, homeOption and id to navigate tabs and pages with routes like: /about-us, /blog/787, profile/8756 ...
// _buildScreens() is a list to set tabs of navigation bar.
// _navBarItems() is a list to set options and style of navBar items

class MainScreen extends StatefulWidget {
  final MainTab initialTab;
  final MoreOption moreOption;
  final HomeOption homeOption;
  final int id;

  MainScreen(
      {@required this.initialTab, this.moreOption, this.homeOption, this.id});

  State<StatefulWidget> createState() {
    return _MainScreenState(
      initialTab,
      moreOption,
      homeOption,
      id,
    );
  }
}

class _MainScreenState extends State<MainScreen> {
  PersistentTabController _controller;
  final MainTab _initialTab;
  final MoreOption _moreOption;
  final HomeOption _homeOption;
  final int _id;

  _MainScreenState(
    this._initialTab,
    this._moreOption,
    this._homeOption,
    this._id,
  );

  @override
  void initState() {
    super.initState();
    _controller =
        PersistentTabController(initialIndex: getInitialIndex(_initialTab));
  }

  List<Widget> _buildScreens() {
    return [
      HomeRoute(),
      MessagesRoute(),
      SearchRoute(),
      ProfileRoute(),
      MoreRoute(_moreOption, _id),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    ThemeData theme = Theme.of(context);
    return [
      PersistentBottomNavBarItem(
        icon: Icon(homeIcon),
        title: homePageTitle,
        activeColor: theme.backgroundColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(messagesIcon),
        title: (messagesPageTitle),
        activeColor: theme.backgroundColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(searchIcon),
        title: (searchPageTitle),
        activeColor: theme.backgroundColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(profileIcon),
        title: (profilePageTitle),
        activeColor: theme.backgroundColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(moreIcon),
        title: (morePageTitle),
        activeColor: theme.backgroundColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AboutUsProvider()),
        ChangeNotifierProvider.value(value: ContactUsProvider()),
        ChangeNotifierProvider.value(value: FaqProvider()),
        ChangeNotifierProvider.value(value: ManualProvider()),
        ChangeNotifierProvider.value(value: PricingProvider()),
        ChangeNotifierProvider.value(value: RuleProvider()),
        ChangeNotifierProvider.value(value: BlogProvider()),
        ChangeNotifierProvider.value(value: BlogPostProvider()),
      ],
      child: MaterialApp(
        theme: defaultTheme,
        home: Scaffold(
          body: PersistentTabView(
            controller: _controller,
            screens: _buildScreens(),
            confineInSafeArea: true,
            itemCount: 5,
            backgroundColor: Color.fromRGBO(43, 45, 66, 1),
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              colorBehindNavBar: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(43, 45, 66, 1),
                  offset: Offset(0.0, -2.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            popAllScreensOnTapOfSelectedTab: true,
            itemAnimationProperties: ItemAnimationProperties(
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 400),
            ),
            items: _navBarsItems(),
            navBarStyle: _mobileView ? NavBarStyle.style11 : NavBarStyle.style9,
          ),
        ),
      ),
    );
  }
}
