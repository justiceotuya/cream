import 'package:cream_platform_app/data/temp/ads_banner_mock_data.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/ui/category_widget.dart';
import 'package:cream_platform_app/screen/ui/custom_search_box.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 134.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: AdsBannerMockData.getBanners()
                .map(
                  (data) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: ImageLoader(
                      path: data.imageLink,
                      width: 277,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SearchBoxWidget(
            hintText: 'Type name of any artiste or song title',
            textCallBack: null),
        SizedBox(
          height: 20,
        ),
        CategoryWidget(
          icon: bid,
          catName: 'Cream Bid',
        ),
        SizedBox(
          height: 20,
        ),
        CategoryWidget(
          icon: music,
          catName: 'Cream Music',
        ),
        SizedBox(
          height: 20,
        ),
        CategoryWidget(
          icon: video,
          catName: 'Cream Video',
        ),
        SizedBox(
          height: 20,
        ),
        CategoryWidget(
          icon: image,
          catName: 'Cream Images',
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
