import 'package:cream_platform_app/apis/user/update/model/update_profile_model.dart';
import 'package:cream_platform_app/apis/user/update/provider/update_profile_provider.dart';
import 'package:cream_platform_app/helper/validators.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/screen/ui/bid_custom_raised_btton.dart';
import 'package:cream_platform_app/screen/ui/custom_edit_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPersonInformation extends StatelessWidget {
  TextEditingController userNamController;
  TextEditingController addressController;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController phoneController;
  TextEditingController sexController;
  TextEditingController stateController;

  EditPersonInformation(
      {@required this.userNamController,
      @required this.addressController,
      @required this.firstNameController,
      @required this.lastNameController,
      @required this.phoneController,
      @required this.sexController,
      @required this.stateController});

  var _globalFormKey = GlobalKey<FormState>();
  UpdateProfileProvider _profileProvider;

  @override
  Widget build(BuildContext context) {
    _profileProvider =
        Provider.of<UpdateProfileProvider>(context, listen: false);
    _profileProvider.initialize(context);
    return Form(
      key: _globalFormKey,
      child: Consumer<UpdateProfileProvider>(
        builder: (_, provider, __) => Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: EditFormField(
                      controller: firstNameController,
                      label: 'First name',
                      labelStyle: TextStyle(color: textColor6),
                      onSaved: (value) {},
                      focusedColorBorder: yellow,
                      autoValidate: provider.autoValidate,
                      keyboardType: TextInputType.text,
                      validator: Validators.validateString(),
                    ),
                  ),
                  SizedBox(
                    width: 31,
                  ),
                  Expanded(
                    child: EditFormField(
                      controller: lastNameController,
                      label: 'Last name',
                      labelStyle: TextStyle(color: textColor6),
                      onSaved: (value) {},
                      focusedColorBorder: yellow,
                      autoValidate: provider.autoValidate,
                      keyboardType: TextInputType.number,
                      validator: Validators.validateString(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: EditFormField(
                      controller: userNamController,
                      label: 'Email',
                      labelStyle: TextStyle(color: textColor6),
                      onSaved: (value) {},
                      focusedColorBorder: yellow,
                      autoValidate: provider.autoValidate,
                      keyboardType: TextInputType.text,
                      validator: Validators.validateString(),
                    ),
                  ),
                  SizedBox(
                    width: 31,
                  ),
                  Expanded(
                    child: EditFormField(
                      controller: phoneController,
                      label: 'Phone',
                      labelStyle: TextStyle(color: textColor6),
                      onSaved: (value) {},
                      focusedColorBorder: yellow,
                      autoValidate: provider.autoValidate,
                      keyboardType: TextInputType.number,
                      validator: Validators.validateString(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: EditFormField(
                      controller: sexController,
                      label: 'Sex',
                      labelStyle: TextStyle(color: textColor6),
                      onSaved: (value) {},
                      onTapped: () => provider.pickGender(
                          context: context,
                          controller: sexController,
                          gender: provider.gender),
                      focusedColorBorder: yellow,
                      autoValidate: provider.autoValidate,
                      keyboardType: TextInputType.text,
                      validator: Validators.validateString(),
                    ),
                  ),
                  SizedBox(
                    width: 31,
                  ),
                  Expanded(
                    child: EditFormField(
                      controller: stateController,
                      label: 'State',
                      labelStyle: TextStyle(color: textColor6),
                      onSaved: (value) {},
                      focusedColorBorder: yellow,
                      autoValidate: provider.autoValidate,
                      keyboardType: TextInputType.text,
                      onTapped: () => provider.pickState(
                          context: context,
                          controller: stateController,
                          state: provider.state),
                      validator: Validators.validateString(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: EditFormField(
                      controller: addressController,
                      label: 'Address',
                      labelStyle: TextStyle(color: textColor6),
                      onSaved: (value) {},
                      focusedColorBorder: yellow,
                      autoValidate: provider.autoValidate,
                      keyboardType: TextInputType.text,
                      validator: Validators.validateString(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.75,
              ),
              Container(
                height: 30,
                child: BidCustomButtonWidget(
                    color: black,
                    text: 'Update',
                    textSize: 14,
                    textColor: white,
                    onPressed: () => _validate(context),
                    splashColor: black),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState.validate())
      _profileProvider.update(
          map: UpdateProfileModel.toJson(
        address: addressController.text,
        email: userNamController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
        sex: sexController.text,
        state: stateController.text,
      ));
    else
      _profileProvider.toggleAutoValidate(true);
  }
}
