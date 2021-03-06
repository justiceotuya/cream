import 'package:cream_platform_app/apis/content/personal/database/content_history_dao.dart';
import 'package:cream_platform_app/apis/content/personal/repository/history_repository.dart';
import 'package:cream_platform_app/apis/content/personal/repository/toggle_visibility_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final ContentHistoryApiRepository _repository = ContentHistoryApiRepository();
final ToggleVisibilityApiRepository _toggleVisibilityApiRepository =
    ToggleVisibilityApiRepository();

class ContentHistoryProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;
  int _pageNumber = 0;
  bool showPaginationIndicator = false;
  ScrollController scrollController = ScrollController();

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void initScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        incrementPageNumber();
      }
    });
  }

  void history({bool showMainIndicator = true}) async {
    try {
      if (showMainIndicator && contentHistoryDao.box.isEmpty)
        _progressIndicator.show();
      final _response = await _repository.history(page: _pageNumber);
      _response.when(success: (success) async {
        await _progressIndicator.dismiss();
        showPaginationIndicator = false;
        if ((success.data.length > 0) ?? false)
          contentHistoryDao.saveAll(success.data);
        else if (_pageNumber > 1) _pageNumber -= 1;
        notifyListeners();
      }, failure: (NetworkExceptions error) {
        _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
      });
    } catch (e) {
      _progressIndicator.dismiss();
      debugPrint('Error: $e');
    }
  }

  void toggleContent({@required int id}) async {
    try {
      _progressIndicator.show();
      final _response = await _toggleVisibilityApiRepository.toggle(id: id);
      _response.when(success: (success) async {
        await _progressIndicator.dismiss();
        showPaginationIndicator = false;
        showCircleDialogBox(
            context: _context,
            content:
                'Content\nSuccessfully\n${success.data.isPublic ? 'Unhidden' : 'Hidden'}');
        notifyListeners();
      }, failure: (NetworkExceptions error) {
        _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
      });
    } catch (e) {
      _progressIndicator.dismiss();
      debugPrint('Error: $e');
    }
  }

  void incrementPageNumber() {
    _pageNumber += 1;
    showPaginationIndicator = true;
    notifyListeners();
    history(showMainIndicator: false);
  }

  void resetPageNumber() {
    _pageNumber = 1;
  }
}
