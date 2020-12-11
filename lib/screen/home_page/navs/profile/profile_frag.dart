import 'package:cream_platform_app/helper/helper.dart';
import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/authentication/change_password/provider/change_password_provider.dart';
import 'package:cream_platform_app/screen/ui/custom_expansion_tile.dart';
import 'package:cream_platform_app/screen/ui/popularity_widget.dart';
import 'package:cream_platform_app/screen/ui/text_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bid_frag.dart';
import 'widgets/bid_history.dart';
import 'widgets/content_history.dart';
import 'widgets/edit_personal_information.dart';
import 'widgets/edit_profile_password.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _editPersonalInfo = false;
  bool _editPassword = false;
  bool _bid = false;
  bool _content = false;
  bool _isOldPassword = false;
  bool _isNewPassword = false;
  ChangePasswordProviders _changePasswordProviders;

  List<ListItem> _dropdownItems = [
    ListItem(1, "All"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;

  ListItem _selectedItem;

  void initState() {
    super.initState();
    _changePasswordProviders =
        Provider.of<ChangePasswordProviders>(context, listen: false);
    _changePasswordProviders.initialize(context);
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownItems[0];
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: TextViewWidget(
            text: listItem.name,
            textSize: 12,
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  void dispose() {
    _changePasswordProviders.newPasswordError = false;
    _changePasswordProviders.confirmNewPasswordError = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 124.04,
          decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.all(Radius.circular(17))),
          child: Stack(
            children: [
              Image.asset(
                zigzag,
                fit: BoxFit.cover,
                width: getWidth(context),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: <Widget>[
                          CircleImageLoader(
                            width: 71,
                            height: 71,
                            path:
                                'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: white),
                            child: Center(
                              child: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: black,
                                    size: 15,
                                  ),
                                  onPressed: null),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        width: getWidth(context) * 0.5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextViewWidget(
                              text: 'Pre Jay',
                              textSize: 14,
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              color: yellow,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            TextViewWidget(
                              text: 'prejay@gmail.com',
                              textSize: 12,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              color: white,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 17,
                        width: 17,
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, color: green),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 73, right: 73, top: 20, bottom: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Popularity(
                icon: upload,
                text: 'Total Upload',
                number: 10,
              ),
              Container(
                height: 35,
                width: 0.5,
                color: borderColor1,
              ),
              Popularity(
                icon: heart,
                text: 'Total Likes',
                number: 40,
              ),
            ],
          ),
        ),
        CustomExpansionTile(
          leading: person,
          title: 'Personal Information',
          isOpened: _editPersonalInfo,
          onTap: () => setState(() => _editPersonalInfo = !_editPersonalInfo),
        ),
        Visibility(
            visible: _editPersonalInfo,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                EditPersonInformation(),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        Divider(
          thickness: 0.5,
        ),
        CustomExpansionTile(
          leading: password,
          title: 'Change Password',
          isOpened: _editPassword,
          onTap: () => setState(() => _editPassword = !_editPassword),
        ),
        Visibility(
            visible: _editPassword,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                EditPassword(
                  togglePasswordCallback: null,
                  isObsecure: null,
                  toggledPasswordIcon: null,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        Divider(
          thickness: 0.5,
        ),
        CustomExpansionTile(
          leading: bid,
          title: 'Bidding History',
          isOpened: _bid,
          onTap: () => setState(() => _bid = !_bid),
        ),
        Visibility(
            visible: _bid,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                BidHistory(),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        Divider(
          thickness: 0.5,
        ),
        CustomExpansionTile(
          leading: upNext,
          title: 'Content History',
          isOpened: _content,
          onTap: () => setState(() => _content = !_content),
        ),
        Visibility(
            visible: _content,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ContentHistory(
                  dropdownMenuItems: _dropdownMenuItems,
                  selectedItem: _selectedItem,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        Divider(
          thickness: 0.5,
        ),
        CustomExpansionTile(
          leading: setting,
          title: 'Settings',
        ),
      ],
    );
  }
}
