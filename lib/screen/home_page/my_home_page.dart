import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/navigator/route.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/home_page/image/image_play.dart';
import 'package:cream_platform_app/screen/home_page/navs/home_frag.dart';
import 'package:cream_platform_app/screen/home_page/navs/search_frag.dart';
import 'package:cream_platform_app/screen/home_page/navs/upload_frag.dart';
import 'package:cream_platform_app/screen/home_page/navs/video_frag.dart';
import 'package:cream_platform_app/screen/home_page/video/video_play.dart';
import 'package:cream_platform_app/screen/ui/app_bar/custom_app_bar.dart';
import 'package:cream_platform_app/screen/ui/bottom_nav/custom_bottom_nav.dart';
import 'package:cream_platform_app/screen/ui/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'music/music_play.dart' as musicPlay;
import 'navs/bid_frag.dart';
import 'navs/profile/profile_frag.dart';
import 'navs/wallet/wallet_frg.dart';
import 'navs/music_frag.dart';
import 'navs/image_frag.dart' as image;
import 'playlist/playlist.dart';

class MyHomePage extends StatefulWidget {
  int bottomNavIndex;

  MyHomePage({@required this.bottomNavIndex});

  @override
  _MyHomePageState createState() => _MyHomePageState(bottomNavIndex);
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int bottomNavIndex;
  String title;

  _MyHomePageState(this.bottomNavIndex);

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final _widgetList = <Widget>[
    Search(), // 0
    Container(),// 1
    Profile(),// 2
    Home(),// 3
    Bid(),// 4
    Wallet(),// 5
    Upload(),// 6
    Music(),// 7
    Home(),// 8
    musicPlay.MusicPlay(),// 9
    Video(),// 10
    VideoPlay(),// 11
    Wallet(),// 12
    image.Image(),// 13
    ImagePlay(),// 14
  ];

  final iconList = <String>[iconSearch, upNext, person, home];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    onTabTapped(bottomNavIndex);
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return Scaffold(
      extendBody: true,
      key: _scaffoldKey,
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            CustomAppBarWidget(title, onTap: () => openEndDrawer(_scaffoldKey)),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: _widgetList[bottomNavIndex])),
          ],
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          backgroundColor: yellowSplash,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: yellow,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: yellowSplash,
                  blurRadius: 15.0,
                  spreadRadius: 0.1,
                )
              ],
            ),
            child: ImageLoader(
              path: upload,
              height: 24,
              width: 21,
              dColor: white,
            ),
          ),
          onPressed: () => onTabTapped(6),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      endDrawer: ClipRRect(
        child: DrawerWidget(),
      ),
      bottomNavigationBar: CustomAppBar(
        icons: iconList,
        backgroundColor: black,
        activeIndex: bottomNavIndex,
        activeColor: yellow,
        splashColor: yellowSplash,
        inactiveColor: Colors.white,
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) async {
    setState(() {
      bottomNavIndex = index;
      if (bottomNavIndex == 0) {
        setState(() => title = "Search Content");
      }
      if (bottomNavIndex == 1) {
        setState(() => title = "");
        _showSheet();
      }
      if (bottomNavIndex == 2) {
        setState(() => title = "Profile");
      }
      if (bottomNavIndex == 3) {
        setState(() => title = "Home");
      }
      if (bottomNavIndex == 4) {
        setState(() => title = "Cream Bid");
      }
      if (bottomNavIndex == 5) {
        setState(() => title = "Wallet");
      }
      if (bottomNavIndex == 6) {
        setState(() => title = "Upload Content");
      }
      if (bottomNavIndex == 7) {
        setState(() => title = "Cream Music");
      }
      if (bottomNavIndex == 8) {
        setState(() => title = "Home");
      }
      if (bottomNavIndex == 9) {
        setState(() => title = "Music Play");
      }
      if (bottomNavIndex == 10) {
        setState(() => title = "Cream Video");
      }
      if (bottomNavIndex == 11) {
        setState(() => title = "Video Play");
      }
      if (bottomNavIndex == 12) {
        setState(() => title = "Wallet");
      }
      if (bottomNavIndex == 13) {
        setState(() => title = "Cream Images");
      }
      if (bottomNavIndex == 14) {
        setState(() => title = "Cream Images");
      }
    });
  }

  void _showSheet() {
    MusicPlaylistBottomSheet(
            context: context, account: (accountNumber, bankName) {})
        .show();
  }
}
