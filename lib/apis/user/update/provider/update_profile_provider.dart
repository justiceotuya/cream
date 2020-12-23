import 'package:cream_platform_app/apis/user/update/repository/update_profile_repository.dart';
import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/route.dart';
import 'package:cream_platform_app/helper/settings/radio_button.dart';
import 'package:cream_platform_app/network/network_exceptions.dart';
import 'package:cream_platform_app/screen/ui/progress_indicator.dart';
import 'package:flutter/cupertino.dart';

final UpdateUsersProfileApiRepository _repository =
    UpdateUsersProfileApiRepository();

class UpdateProfileProvider with ChangeNotifier {
  bool autoValidate = false;
  String gender;
  String state;

  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void update({@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.updateProfile(map: map);
      _response.when(success: (success) async {
        await _progressIndicator.dismiss();
        showCircleDialogBox(
            context: _context, content: 'Personal\nInformation\nUpdated');
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

  void pickState(
      {@required BuildContext context,
      @required String state,
      @required TextEditingController controller}) async {
    await showOptionsDialog(
      context: context,
      title: 'State',
      displayValue: state,
      selectedValue: state,
      items: [
        SettingRadioValue('Abia', 'Abia'),
        SettingRadioValue('Adamawa', 'Adamawa'),
        SettingRadioValue('Akwa Ibom', 'Akwa Ibom'),
        SettingRadioValue('Anambra', 'Anambra'),
        SettingRadioValue('Bauchi', 'Bauchi'),
        SettingRadioValue('Bayelsa', 'Bayelsa'),
        SettingRadioValue('Benue', 'Benue'),
        SettingRadioValue('Borno', 'Borno'),
        SettingRadioValue('Cross River', 'Cross River'),
        SettingRadioValue('Delta', 'Delta'),
        SettingRadioValue('Ebonyi', 'Ebonyi'),
        SettingRadioValue('Edo', 'Edo'),
        SettingRadioValue('Ekiti', 'Ekiti'),
        SettingRadioValue('Enugu', 'Enugu'),
        SettingRadioValue('FCT', 'FCT'),
        SettingRadioValue('Gombe', 'Gombe'),
        SettingRadioValue('Imo', 'Imo'),
        SettingRadioValue('Jigawa', 'Jigawa'),
        SettingRadioValue('Kaduna', 'Kaduna'),
        SettingRadioValue('Kano', 'Kano'),
        SettingRadioValue('Katsina', 'Katsina'),
        SettingRadioValue('Kebbi', 'Kebbi'),
        SettingRadioValue('Kogi', 'Kogi'),
        SettingRadioValue('Kwara', 'Kwara'),
        SettingRadioValue('Lagos', 'Lagos'),
        SettingRadioValue('Nasarawa', 'Nasarawa'),
        SettingRadioValue('Niger', 'Niger'),
        SettingRadioValue('Ogun', 'Ogun'),
        SettingRadioValue('Ondo', 'Ondo'),
        SettingRadioValue('Osun', 'Osun'),
        SettingRadioValue('Oyo', 'Oyo'),
        SettingRadioValue('Plateau', 'Plateau'),
        SettingRadioValue('Rivers', 'Rivers'),
        SettingRadioValue('Sokoto', 'Sokoto'),
        SettingRadioValue('Taraba', 'Taraba'),
        SettingRadioValue('Yobe', 'Yobe'),
        SettingRadioValue('Zamfara', 'Zamfara'),
      ],
      onChanged: (v) {
        this.state = v;
        controller.text = v;
        pop(context);
        notifyListeners();
      },
    );
  }

  void pickGender(
      {@required BuildContext context,
      @required String gender,
      @required TextEditingController controller}) async {
    await showOptionsDialog(
      context: context,
      title: 'Gender',
      displayValue: gender,
      selectedValue: gender,
      items: [
        SettingRadioValue('MALE', 'MALE'),
        SettingRadioValue('FEMALE', 'FEMALE'),
      ],
      onChanged: (v) {
        this.gender = v;
        controller.text = v;
        pop(context);
        notifyListeners();
      },
    );
  }

  void toggleAutoValidate(bool validate) {
    autoValidate = validate;
    notifyListeners();
  }
}
