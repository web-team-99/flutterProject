import 'package:flutter/material.dart';
import 'package:test_url/Components/asyncImageLoader.dart';
import 'package:test_url/Functions/moreFunctions.dart';
import 'package:test_url/Setting/numbers.dart';

class ProjectAndServiceSuggest extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int price;

  ProjectAndServiceSuggest(
    this.imageUrl,
    this.price,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return InkWell(
      child: Card(
        child: Container(
          width: 240,
          height: 160,
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    // height: _width / 4,
                    width: double.infinity,

                    child: AsyncImageLoader(imageUrl),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment
                          .bottomCenter, // 10% of the width, so there are ten blinds.
                      colors: [
                        const Color.fromRGBO(0, 0, 0, 0),
                        const Color.fromRGBO(0, 0, 0, 1),
                      ], // red to yellow

                      tileMode: TileMode
                          .repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        textDirection: TextDirection.rtl,
                        style: theme.textTheme.bodyText1,
                      ),
                      Text(
                        getPersianNumbers(price.toString()) + ' تومان',
                        textDirection: TextDirection.rtl,
                        style: theme.textTheme.bodyText1,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}

// _imageLoader(String imageUrl) {
//   CachedNetworkImage(
//     imageUrl: imageUrl,
//     placeholder: (context, url) => CustomIndicator(),
//     errorWidget: (context, url, error) => Icon(Icons.error),
//     fit: BoxFit.cover,
//   );
// }
