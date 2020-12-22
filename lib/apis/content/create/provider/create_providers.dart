import 'package:cream_platform_app/apis/content/create/repository/create_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final CreateApiRepository _repository = CreateApiRepository();

class CreateContentsProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void create({@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.create(map: map);
      _response.when(success: (success) async {
        await _progressIndicator.dismiss();
        showCircleDialogBox(
            context: _context, content: 'Content\nSuccessfully\nUploaded');
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
