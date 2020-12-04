import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_edit_text_widget.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class BiItems {
  String image;
  String name;
  int timeLeft;

  BiItems(this.image, this.name, this.timeLeft);

  static List<BiItems> getBiItems() {
    List<BiItems> _bidLists = [];
    BiItems _bid = BiItems(
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-xr-red-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038669',
        'Iphone XR',
        30);
    _bidLists.add(_bid);
    _bid = BiItems(
        'https://images.homedepot-static.com/productImages/f380ba1e-c4fb-4cd7-a484-1ec5cf5441d9/svn/fingerprint-resistant-stainless-steel-samsung-french-door-refrigerators-rf28r6201sr-64_1000.jpg',
        'Refrigerator',
        31);
    _bidLists.add(_bid);
    _bid = BiItems(
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-xr-red-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038669',
        'Iphone XR',
        30);
    _bidLists.add(_bid);
    _bid = BiItems(
        'https://image-us.samsung.com/SamsungUS/home/televisions-and-home-theater/tvs/full-hd/pd/un32n5300afxza/gallery/DT-UN32N5300AFXZA-heroimage-050118.jpg',
        'Samsung TV',
        11);
    _bidLists.add(_bid);
    _bid = BiItems(
        'https://cdn.pocket-lint.com/r/s/1200x/assets/images/143354-games-feature-sony-playstation-5-release-date-rumours-and-everything-you-need-to-know-about-ps5-image1-cvz3adase9.jpg',
        'PlayStation 5',
        2);
    _bidLists.add(_bid);
    _bid = BiItems(
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-xr-red-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038669',
        'Iphone XR',
        30);
    _bidLists.add(_bid);
    _bid = BiItems(
        'https://image-us.samsung.com/SamsungUS/home/televisions-and-home-theater/tvs/full-hd/pd/un32n5300afxza/gallery/DT-UN32N5300AFXZA-heroimage-050118.jpg',
        'Samsung TV',
        11);
    _bidLists.add(_bid);
    _bid = BiItems(
        'https://cdn.pocket-lint.com/r/s/1200x/assets/images/143354-games-feature-sony-playstation-5-release-date-rumours-and-everything-you-need-to-know-about-ps5-image1-cvz3adase9.jpg',
        'PlayStation 5',
        2);
    _bidLists.add(_bid);
    return _bidLists;
  }
}

class Bid extends StatefulWidget {
  @override
  _BidState createState() => _BidState();
}

class _BidState extends State<Bid> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "All"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;

  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownItems[0];
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: TextViewWidget(
            text: listItem.name,
            textSize: 12,
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    /*24 is for notification bar on Android*/
    final double itemHeight = (getHeight(context) - kToolbarHeight - 24) / 2;
    final double itemWidth = getWidth(context) / 2;
    return ListView(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: ImageLoader(
            height: 134,
            path: creamBidBanner,
            width: getWidth(context),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.filter_alt_outlined,
                  color: black,
                  size: 14,
                ),
                SizedBox(
                  width: 5,
                ),
                TextViewWidget(
                  text: 'Filter',
                  textSize: 14,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  color: red,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: white,
                      border: Border.all(color: borderColor)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: _selectedItem,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 12,
                        ),
                        items: _dropdownMenuItems,
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value;
                          });
                        }),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: black,
                  size: 14,
                ),
                SizedBox(
                  width: 5,
                ),
                TextViewWidget(
                  text: 'Back to Home',
                  textSize: 14,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  color: red,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        GridView.count(
          crossAxisCount: 3,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: (itemWidth / itemHeight),
          children: shuffle(BiItems.getBiItems())
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 106,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(0.0, 0.0), //(x,y)
                                  blurRadius: 2.0,
                                  spreadRadius: 0.1),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: yellowSplash,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                  ),
                                  child: ImageLoader(
                                    path: e.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                TextViewWidget(
                                  text: e.name,
                                  textSize: 12,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  color: textColor1,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 30,
                                  child: BidCustomEditTextWidget(
                                    controller: null,
                                    err: '',
                                    hint: 'Enter Amount',
                                    borderRadius: 5,
                                    fontSize: 12,
                                    textAlign: TextAlign.center,
                                    textInputType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: getWidth(context),
                                  height: 30,
                                  child: BidCustomButtonWidget(
                                    onPressed: () =>
                                        showFundDialogBox(context: context),
                                    color: yellow,
                                    textColor: white,
                                    text: 'Bid',
                                    splashColor: yellowSplash,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextViewWidget(
                                  text: '${e.timeLeft} hours left',
                                  textSize: 11,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  color: e.timeLeft > 2 ? green : red,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
