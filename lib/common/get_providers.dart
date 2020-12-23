import 'package:cream_platform_app/apis/bid/get_bid/provider/get_bid_providers.dart';
import 'package:cream_platform_app/apis/bid/make_bid/provider/make_bid_providers.dart';
import 'package:cream_platform_app/apis/bid/open/id/provider/number_providers.dart';
import 'package:cream_platform_app/apis/bid/open/number/provider/number_providers.dart';
import 'package:cream_platform_app/apis/bid/update_bid/provider/update_bid_providers.dart';
import 'package:cream_platform_app/apis/bid/winner/provider/bid_winner_providers.dart';
import 'package:cream_platform_app/apis/bidentry/all/provider/get_all_bid_entry_providers.dart';
import 'package:cream_platform_app/apis/bidentry/bid/get_bid_entry/provider/get_bid_providers.dart';
import 'package:cream_platform_app/apis/bidentry/bid/get_bid_phone/provider/get_bid_providers.dart';
import 'package:cream_platform_app/apis/bidentry/phone/provider/get_all_bid_entry_providers.dart';
import 'package:cream_platform_app/apis/bidentry/statistics/provider/get_all_bid_entry_statistics_providers.dart';
import 'package:cream_platform_app/apis/biditem/find/find/provider/find_bid_item_find_providers.dart';
import 'package:cream_platform_app/apis/biditem/find/status/provider/find_bid_item_status_providers.dart';
import 'package:cream_platform_app/apis/biditem/id/provider/get_or_delete_bid_providers.dart';
import 'package:cream_platform_app/apis/comment/create_comment/provider/create_comment_providers.dart';
import 'package:cream_platform_app/apis/comment/get_comment/provider/get_comment_providers.dart';
import 'package:cream_platform_app/apis/content/create/provider/create_providers.dart';
import 'package:cream_platform_app/apis/user/update/provider/update_profile_provider.dart';
import 'package:cream_platform_app/apis/vote/get_vote/provider/get_vote_providers.dart';
import 'package:cream_platform_app/apis/vote/post_vote/provider/post_a_vote_providers.dart';
import 'package:cream_platform_app/screen/authentication/change_password/provider/change_password_provider.dart';
import 'package:cream_platform_app/screen/authentication/forgot_password/provider/forgot_password_providers.dart';
import 'package:cream_platform_app/screen/authentication/login/provider/login_providers.dart';
import 'package:cream_platform_app/screen/authentication/signup/provider/signup_providers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'pref_manager_provider.dart';
import 'utility_providers.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<SignUpProviders>(create: (_) => SignUpProviders()),
    ChangeNotifierProvider<PrefManagerProvider>(
        create: (_) => PrefManagerProvider()),
    ChangeNotifierProvider<LoginProviders>(create: (_) => LoginProviders()),
    ChangeNotifierProvider<UtilityProvider>(create: (_) => UtilityProvider()),
    ChangeNotifierProvider<ForgotPasswordProviders>(
        create: (_) => ForgotPasswordProviders()),
    ChangeNotifierProvider<ChangePasswordProviders>(
        create: (_) => ChangePasswordProviders()),
    ChangeNotifierProvider<GetBidProviders>(create: (_) => GetBidProviders()),
    ChangeNotifierProvider<MakeBidProviders>(create: (_) => MakeBidProviders()),
    ChangeNotifierProvider<OpenIDProviders>(create: (_) => OpenIDProviders()),
    ChangeNotifierProvider<OpenNumberProviders>(
        create: (_) => OpenNumberProviders()),
    ChangeNotifierProvider<UpdateBidProviders>(
        create: (_) => UpdateBidProviders()),
    ChangeNotifierProvider<BidWinnerProvider>(
        create: (_) => BidWinnerProvider()),
    ChangeNotifierProvider<GetAllBidEntryProviders>(
        create: (_) => GetAllBidEntryProviders()),
    ChangeNotifierProvider<GetBidEntryProviders>(
        create: (_) => GetBidEntryProviders()),
    ChangeNotifierProvider<GetBidEntryPhoneProviders>(
        create: (_) => GetBidEntryPhoneProviders()),
    ChangeNotifierProvider<GetAllBidEntryPhoneProviders>(
        create: (_) => GetAllBidEntryPhoneProviders()),
    ChangeNotifierProvider<GetAllBidEntryStatisticsProviders>(
        create: (_) => GetAllBidEntryStatisticsProviders()),
    ChangeNotifierProvider<FindBidItemFindApiProvider>(
        create: (_) => FindBidItemFindApiProvider()),
    ChangeNotifierProvider<GetOrDeleteProvider>(
        create: (_) => GetOrDeleteProvider()),
    ChangeNotifierProvider<FindBidStatusProvider>(
        create: (_) => FindBidStatusProvider()),
    ChangeNotifierProvider<GetCommentsProviders>(
        create: (_) => GetCommentsProviders()),
    ChangeNotifierProvider<CreateCommentsProviders>(create: (_) => CreateCommentsProviders()),
    ChangeNotifierProvider<PostAVoteProviders>(create: (_) => PostAVoteProviders()),
    ChangeNotifierProvider<GetVoteProviders>(create: (_) => GetVoteProviders()),
    ChangeNotifierProvider<CreateContentsProviders>(create: (_) => CreateContentsProviders()),
    ChangeNotifierProvider<UpdateProfileProvider>(create: (_) => UpdateProfileProvider()),
  ];
}
