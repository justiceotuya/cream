import 'package:cream_platform_app/apis/bidentry/bid/get_bid_entry/repository/get_bid_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final GetBidEntryApiRepository _repository = GetBidEntryApiRepository();

class GetBidProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void getBidEntry(
      {@required int number, @required int page, @required int size}) async {
    try {
      _progressIndicator.show();
      final _response =
          await _repository.getBidEntry(number: number, page: page, size: size);
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
