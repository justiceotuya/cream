import 'package:cream_platform_app/apis/comment/create_comment/repository/create_comment_repository.dart';
import 'package:cream_platform_app/apis/vote/post_vote/repository/post_a_vote_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final PostAVoteApiRepository _repository = PostAVoteApiRepository();

class PostAVoteProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void postVote({@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.vote(map: map);
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
