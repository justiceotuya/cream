import 'package:cream_platform_app/common/utility_providers.dart';
import 'package:cream_platform_app/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'common/get_providers.dart';
import 'common/pref_manager_provider.dart';
import 'helper/local_manager.dart';
import 'navigator/route.dart';

void main() async {
  // initialize local storage
  await LocalDataSourceProvider.initialize();
  // get users cached data
  await PrefManagerProvider.getData();
  await UtilityProvider.getListOfStates();
  runApp(MultiProvider(providers: Providers.getProviders, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      // statusBarColor is used to set Status bar color in Android devices.
        statusBarColor: Colors.transparent,
        // To make Stataus bar icons color white in Android devices.
        statusBarIconBrightness: Brightness.light,
        // statusBarBrightness is used to set Status bar icon color in iOS.
        statusBarBrightness: Brightness.light
      // Here light means dark color Status bar icons.
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'AvertaDemoPE'),
      home: Builder(
        builder: (context) {
          return SplashScreen();
        },
      ),
      routes: Routes.getRoutes,
    );
  }
}
