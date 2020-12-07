import 'package:cream_platform_app/apis/biditem/find/status/repository/find_bid_item_find_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final FindBidStatusFindApiRepository _repository =
    FindBidStatusFindApiRepository();

class GetAllBidEntryStatisticsProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void findBidFind(
      {@required int page, @required int size, @required String status}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.findBidStatusFind(
          size: size, page: page, status: status);
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
