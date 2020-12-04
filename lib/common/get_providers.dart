import 'package:cream_platform_app/screen/authentication/login/provider/login_providers.dart';
import 'package:cream_platform_app/screen/authentication/signup/provider/signup_providers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'pref_manager_provider.dart';
import 'utility_providers.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<SignUpProviders>(create: (_) => SignUpProviders()),
    ChangeNotifierProvider<PrefManagerProvider>(create: (_) => PrefManagerProvider()),
    ChangeNotifierProvider<LoginProviders>(create: (_) => LoginProviders()),
    ChangeNotifierProvider<UtilityProvider>(create: (_) => UtilityProvider()),
  ];
}
