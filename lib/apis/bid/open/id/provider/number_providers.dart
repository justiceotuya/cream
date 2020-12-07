import 'package:cream_platform_app/apis/bid/open/number/repository/number_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final OpenNumberBidApiRepository _repository = OpenNumberBidApiRepository();

class OpenNumberProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void bid({@required int amount, @required String number}) async {
    try {
      _progressIndicator.show();
      final _response =
          await _repository.winner(amount: amount, number: number);
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
