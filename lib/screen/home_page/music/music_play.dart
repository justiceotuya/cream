import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_edit_text_widget.dart';
import 'package:cream_platform_app/screen/ui/custom_search_box.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:wave_progress_bars/wave_progress_bars.dart';

class Music {
  String image;
  String artiste;
  String Song;

  Music(this.image, this.artiste, this.Song);

  static List<Music> getMusic() {
    List<Music> _music = [];
    Music _m = Music(
        'https://dailypost.ng/wp-content/uploads/2020/09/davido.jpg',
        'Davido',
        'FEM!');
    _music.add(_m);
    _m = Music('https://i.ytimg.com/vi/Q9lpzKvTzSY/maxresdefault.jpg',
        'Tiwa Savaga', 'Suffer');
    _music.add(_m);
    _m = Music('https://www.bellanaija.com/wp-content/uploads/2019/06/Simi.jpg',
        'Simi', 'Doromi');
    _music.add(_m);
    _m = Music('https://ichef.bbci.co.uk/images/ic/960x540/p03h3sd3.jpg',
        'Kiss Daniel', 'Woju');
    _music.add(_m);
    _m = Music(
        'https://primarytalent.com/artists/patoranking/documents/patoranking_hires.jpg',
        'Patoranking',
        'Shamaya');
    _music.add(_m);
    return _music;
  }
}

class MusicPlay extends StatefulWidget {
  @override
  _MusicPlayState createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay> {
  final List<double> values = [];
  bool _favourite = false;

  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    for (var i = 0; i < 50; i++) {
      values.add(rng.nextInt(30) * 1.0);
    }
    return Material(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: SearchBoxWidget(
                hintText: 'Type name of any artiste or song title',
                textCallBack: null),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageLoader(
                path: music,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 14,
              ),
              TextViewWidget(
                text: 'Listening to',
                textSize: 14,
                textAlign: TextAlign.left,
                maxLines: 1,
                color: black,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CarouselSlider(
                  items: shuffle(Music.getMusic()).map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ImageLoader(
                            path: image.image,
                            width: getWidth(context),
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 186,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.55,
                    initialPage: 1,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (t, y) {},
                    scrollDirection: Axis.horizontal,
                  )),
              SizedBox(
                height: 6,
              ),
              Container(
                margin: EdgeInsets.only(left: 90, right: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: grey,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: _favourite
                                ? Icon(
                                    Icons.favorite,
                                    color: red,
                                  )
                                : Icon(
                                    Icons.favorite_border_outlined,
                                    color: red,
                                  ),
                            onPressed: () =>
                                setState(() => _favourite = !_favourite)),
                        TextViewWidget(
                          text: '12',
                          textSize: 14,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          color: black,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              TextViewWidget(
                text: 'Jay Baby',
                textSize: 14,
                textAlign: TextAlign.center,
                color: textColor1,
                maxLines: 1,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
              SizedBox(
                height: 3,
              ),
              TextViewWidget(
                text: 'Jay Baby The Album',
                textSize: 12,
                textAlign: TextAlign.center,
                color: textColor1,
                maxLines: 1,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
              ),
              SizedBox(
                height: 15,
              ),
              WaveProgressBar(
                progressPercentage: 10,
                listOfHeights: values,
                width: 200,
                initalColor: grey1,
                progressColor: red,
                timeInMilliSeconds: 2000,
                isHorizontallyAnimated: true,
                isVerticallyAnimated: true,
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextViewWidget(
                      text: '03:36',
                      textSize: 12,
                      textAlign: TextAlign.center,
                      color: grey,
                      maxLines: 1,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    TextViewWidget(
                      text: '01:22',
                      textSize: 12,
                      textAlign: TextAlign.center,
                      color: grey,
                      maxLines: 1,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.repeat_one_outlined,
                    color: grey,
                  ),
                  SizedBox(
                    width: 37,
                  ),
                  Icon(
                    Icons.skip_previous,
                    color: grey,
                  ),
                  SizedBox(
                    width: 37,
                  ),
                  Icon(
                    Icons.play_circle_outline_rounded,
                    color: red,
                    size: 50,
                  ),
                  SizedBox(
                    width: 37,
                  ),
                  Icon(
                    Icons.skip_next,
                    color: grey,
                  ),
                  SizedBox(
                    width: 37,
                  ),
                  Icon(
                    Icons.shuffle,
                    color: grey,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 70, right: 70),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: grey,
                )),
            child: Row(
              children: [
                Container(
                  width: getWidth(context) * 0.5,
                  child: TextViewWidget(
                    text: 'http://creamplaform.com/noy',
                    textSize: 12,
                    textAlign: TextAlign.center,
                    color: textColor1,
                    maxLines: 1,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: getHeight(context),
                  width: 1,
                  color: grey,
                ),
                Expanded(
                  child: IconButton(
                      icon: Icon(
                        Icons.copy,
                        size: 18,
                        color: grey,
                      ),
                      onPressed: null),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: CircleImageLoader(
                  width: 35,
                  height: 35,
                  path:
                      'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
                ),
              ),
              Expanded(
                flex: 6,
                child: BidCustomEditTextWidget(
                  controller: null,
                  err: '',
                  hint: 'Add your comment',
                  fontSize: 12,
                  textAlign: TextAlign.left,
                  textInputType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1.2,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CircleImageLoader(
                  width: 35,
                  height: 35,
                  path:
                      'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextViewWidget(
                      text: 'Jaycee',
                      textSize: 14,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      color: black,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    TextViewWidget(
                      text: 'Wonderful song. Love it!',
                      textSize: 12,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      color: black,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
