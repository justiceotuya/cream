import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

class BidHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: shuffle(BidHistoryModel.list())
              .map((data) => Container(
                    width: 90,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: grey2.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: white,
                            ),
                            child: ImageLoader(
                              path: data.image,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          TextViewWidget(
                            text: data.title,
                            textSize: 10,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            color: textColor1,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: getWidth(context),
                            height: 20,
                            child: BidCustomButtonWidget(
                              onPressed: () {},
                              color: data.state == 0 ? grey : green,
                              textColor: white,
                              text: data.buttonText,
                              textSize: 10,
                              splashColor: yellowSplash,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}

class BidHistoryModel {
  String image;
  String title;
  String buttonText;
  bool visibility;
  int state;

  BidHistoryModel(
      {this.image, this.title, this.buttonText, this.visibility, this.state});

  static List<BidHistoryModel> list() {
    List<BidHistoryModel> _data = [];
    BidHistoryModel _model = BidHistoryModel(
      title: 'Samsung Tv',
      buttonText: 'Lost',
      state: 0,
      visibility: false,
      image:
          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    );
    _data.add(_model);
    _model = BidHistoryModel(
      title: 'Iphone XR',
      buttonText: 'Lost',
      state: 0,
      visibility: false,
      image:
          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    );
    _data.add(_model);
    _model = BidHistoryModel(
      title: 'lG XR',
      buttonText: 'Won',
      state: 1,
      visibility: true,
      image:
          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    );
    _data.add(_model);
    _model = BidHistoryModel(
      title: 'Samsung Tv',
      buttonText: 'Lost',
      state: 0,
      visibility: false,
      image:
          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    );
    _data.add(_model);
    _model = BidHistoryModel(
      title: 'Iphone XR',
      buttonText: 'Bid',
      state: 0,
      visibility: false,
      image:
          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    );
    _data.add(_model);
    _model = BidHistoryModel(
      title: 'lG XR',
      buttonText: 'Won',
      state: 1,
      visibility: true,
      image:
          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    );
    _data.add(_model);
    return _data;
  }
}
