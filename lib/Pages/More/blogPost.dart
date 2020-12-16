import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_url/AppBars/normalAppBar.dart';
import 'package:test_url/Components/asyncImageLoader.dart';
import 'package:test_url/Components/customToast.dart';
import 'package:test_url/Pages/customErrorWidget.dart';
import 'package:test_url/Components/customIndicator.dart';
import 'package:test_url/Functions/moreFunctions.dart';
import 'package:test_url/Setting/numbers.dart';
import 'package:test_url/Setting/serverUrl.dart';
import 'package:test_url/Setting/strings.dart';
import 'package:test_url/providers/MorePageProviders/blogPostProvider.dart';
import 'package:provider/provider.dart';

class BlogPost extends StatefulWidget {
  final int _postId;

  BlogPost(this._postId);

  @override
  _BlogPostState createState() => _BlogPostState(_postId);
}

class _BlogPostState extends State<BlogPost> {
  FToast fToast;
  final _scrollController = ScrollController();

  final int _postId;

  String _imageUrl;
  String _title;
  String _date;
  String _time;
  String _content;

  _BlogPostState(this._postId);

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text(blogPostPageTitle),
        centerTitle: true,
        textTheme: theme.textTheme,
      ),
      body: FutureBuilder(
          future: Provider.of<BlogPostProvider>(context, listen: false)
              .fetchBlogPost(_postId),
          builder: (ctx, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return CustomIndicator();
            } else {
              if (snapShot.hasError) {
                return CustomErrorWidget();
              } else {
                return Consumer<BlogPostProvider>(builder: (ctx, data, child) {
                  _title = data.blogPost[0]['title'];
                  _content = data.blogPost[0]['content'];
                  _imageUrl = data.blogPost[0]['image'];
                  _date = getBlogPostDate(data.blogPost[0]['create_time']);
                  _time = getBlogPostTime(data.blogPost[0]['create_time']);
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
                        child: Card(
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10)),
                          // elevation: 3,
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
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      child: AsyncImageLoader(_imageUrl)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(_date,
                                                textDirection:
                                                    TextDirection.rtl,
                                                style:
                                                    theme.textTheme.subtitle1),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 5),
                                      child: SelectableText(_title,
                                          textDirection: TextDirection.rtl,
                                          style: theme.textTheme.headline5),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: SelectableText(
                                        _content,
                                        textDirection: TextDirection.rtl,
                                        style: theme.textTheme.bodyText2,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RaisedButton(
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Icon(Icons.share),
                                              ),
                                              Text(
                                                'اشتراک',
                                                style:
                                                    theme.textTheme.bodyText1,
                                                textDirection:
                                                    TextDirection.rtl,
                                              )
                                            ],
                                          ),
                                          onPressed: () => {
                                            FlutterClipboard.copy(blogUrl +
                                                    '/' +
                                                    _postId.toString())
                                                .then(
                                              (value) => fToast.showToast(
                                                child: CustomToast(
                                                  'لینک کپی شد.',
                                                  Icons.check,
                                                ),
                                                gravity: ToastGravity.BOTTOM,
                                                toastDuration:
                                                    Duration(seconds: 2),
                                              ),
                                            ),
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
              }
            }
          }),
    );
  }
}
