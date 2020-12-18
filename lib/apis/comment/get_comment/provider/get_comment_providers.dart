import 'package:cream_platform_app/apis/bid/get_bid/repository/get_bid_repository.dart';
import 'package:cream_platform_app/apis/comment/get_comment/repository/get_comment_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final GetCommentApiRepository _repository = GetCommentApiRepository();

class GetCommentsProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void getAllComments({@required int id, @required int page}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.getAllComments(
        id: id,
        page: page,
      );
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
