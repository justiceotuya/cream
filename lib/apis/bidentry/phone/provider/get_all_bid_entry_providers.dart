import 'package:cream_platform_app/apis/bidentry/phone/repository/get_all_bid_entry_phone_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final GetAllBidEntryPhoneApiRepository _repository =
    GetAllBidEntryPhoneApiRepository();

class GetAllBidEntryPhoneProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void getAllBidEntry(
      {@required int page, @required int size, @required String phone}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.getAllBidEntryPhone(
          page: page, size: size, phone: phone);
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
