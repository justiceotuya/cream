import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/helper/instances.dart';
import 'package:cream_platform_app/navigator/page_router.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/resources/string_resources.dart';
import 'package:cream_platform_app/screen/home_page/my_home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _startTime();
    super.initState();
  }

  _startTime() async {
    await Future.delayed(Duration(seconds: 2));
    bool _keepMeSignedInIsAvailable =
        await preferencesHelper.doesExists(key: AppString.keepMeSignedIn);
    if (_keepMeSignedInIsAvailable) {
      bool _keepMeSignedIn =
          await preferencesHelper.getBoolValues(key: AppString.keepMeSignedIn);
      if (_keepMeSignedIn)
        PageRouter.gotoWidget(MyHomePage(bottomNavIndex: 8), context,
            clearStack: true);
      else
        PageRouter.gotoNamed(Routes.LOGIN, context, clearStack: true);
    } else
      PageRouter.gotoNamed(Routes.LOGIN, context, clearStack: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ImageLoader(
        width: getWidth(context),
        height: getHeight(context),
        path: splash,
        fit: BoxFit.contain,
      ),
    );
  }
}
