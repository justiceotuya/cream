import 'package:cream_platform_app/apis/bidentry/statistics/repository/get_all_bid_entry_statistics_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final GetAllBidEntryStatisticsApiRepository _repository =
    GetAllBidEntryStatisticsApiRepository();

class GetAllBidEntryStatisticsProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void getAllBidEntry({@required String bid, @required String date}) async {
    try {
      _progressIndicator.show();
      final _response =
          await _repository.getAllBidEntryStatistics(bid: bid, date: date);
      _response.when(success: (success) async {
        await _progressIndicator.dismiss();
      }, failure: (NetworkExceptions error) async {
        await _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
      });
    } catch (e) {
      await _progressIndicator.dismiss();
      debugPrint('Error: $e');
    }
  }
}
