import 'package:cream_platform_app/helper/image_loader_helper.dart';
import 'package:cream_platform_app/helper/route.dart';
import 'package:cream_platform_app/resources/color_resources.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:cream_platform_app/screen/home_page/my_home_page.dart';
import 'package:flutter/material.dart';

import '../text_view_widget.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        child: Drawer(
          elevation: 8,
          child: Container(
            margin: EdgeInsets.only(right: 50),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: ImageLoader(
                    path: appIcon,
                    width: 84,
                    height: 84,
                  ),
                ),
                SizedBox(
                  height: 44,
                ),
                ListItemWidget(
                    title: 'Home',
                    icon: home,
                    onTap: () => _navigate(context, 8)),
                SizedBox(
                  height: 8,
                ),
                ListItemWidget(
                    title: 'Cream Bid',
                    icon: bid,
                    onTap: () => _navigate(context, 4)),
                SizedBox(
                  height: 8,
                ),
                ListItemWidget(
                    title: 'Cream Music',
                    icon: music,
                    onTap: () => _navigate(context, 7)),
                SizedBox(
                  height: 8,
                ),
                ListItemWidget(
                    title: 'Cream Video',
                    icon: video,
                    onTap: () => _navigate(context, 10)),
                SizedBox(
                  height: 8,
                ),
                ListItemWidget(
                    title: 'Cream Images',
                    icon: image,
                    onTap: () => _navigate(context, 13)),
                SizedBox(
                  height: 8,
                ),
                ListItemWidget(
                    title: 'Subscription Status',
                    icon: subscription,
                    onTap: () => _navigate(context, 12)),
                SizedBox(
                  height: 8,
                ),
                ListItemWidget(
                    title: 'Wallet',
                    icon: wallet,
                    onTap: () => _navigate(context, 12)),
                SizedBox(
                  height: 8,
                ),
                ListItemWidget(title: 'Settings', icon: setting, onTap: () {}),
                SizedBox(
                  height: 58.5,
                ),
                Center(
                  child: TextViewWidget(
                    text: 'Log out, Olabisi?',
                    textSize: 16,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    color: textColor5,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 59,
                ),
                Center(
                  child: TextViewWidget(
                    text: 'Copyright @ CREAM 2020',
                    textSize: 10,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    color: textColor5,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigate(BuildContext context, int i) {
    pop(context);
    pushReplace(
        context: context,
        child: MyHomePage(
          bottomNavIndex: i,
        ));
  }
}

class ListItemWidget extends StatelessWidget {
  String title;
  String icon;
  VoidCallback onTap;

  ListItemWidget(
      {@required this.title, @required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: TextViewWidget(
            text: title,
            textSize: 16,
            textAlign: TextAlign.right,
            maxLines: 1,
            color: textColor5,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
          trailing: ImageLoader(
            path: icon,
          ),
        ),
        Divider(
          thickness: 0.5,
        )
      ],
    );
  }
}
