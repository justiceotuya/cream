import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cream_platform_app/resources/image_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

/// handle image loading
// ignore: must_be_immutable, non_constant_identifier_names
class ImageLoader extends StatelessWidget {
  ImageLoader(
      {this.width,
      this.height,
      this.path,
      this.file,
      this.color,
      this.dColor,
      this.isOnline = false,
      this.onTap,
      this.borderRadius,
      this.fit = BoxFit.cover,
      Key key})
      : super(key: key);

  double width;
  double height;
  String path;
  File file;
  Color color;
  Color dColor;
  bool isOnline;
  Function() onTap;
  BorderRadius borderRadius;
  BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (file != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(height / 2),
        child: Image.file(
          file,
          width: width,
          height: height,
          fit: fit,
        ),
      );
    } else if (path.contains("http")) {
      return GestureDetector(
        onTap: onTap,
        child: CachedNetworkImage(
          imageUrl: path,
          fit: fit,
          imageBuilder: (context, imageProvider) => Container(
            width: width,
            height: height,
            child: Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: color != null ? color : Colors.transparent,
                    shape: BoxShape.rectangle,
                    borderRadius: borderRadius,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: fit,
                    ),
                  ),
                ),
              ],
            ),
          ),
          placeholder: (context, url) => Container(
            width: width,
            height: height,
            child: SvgPicture.asset(
              appIcon,
              fit: fit,
            ),
          ),
          errorWidget: (context, url, error) => Container(
            width: width,
            height: height,
            child: SvgPicture.asset(
              appIcon,
              fit: fit,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: color != null ? color : Colors.transparent,
            child: path.contains(".svg")
                ? SvgPicture.asset(
                    path,
                    width: width,
                    height: height,
                    fit: fit,
                    color: dColor,
                  )
                : Image.asset(
                    path,
                    width: width,
                    fit: fit,
                    height: height,
                  ),
          ),
        ),
      );
    }
  }
}

/// handles image loading for circle images
// ignore: must_be_immutable
class CircleImageLoader extends StatelessWidget {
  double height;
  double width;
  String path;
  File file;
  Color color;
  Color dColor;
  bool isOnline;
  Function() onTap;

  CircleImageLoader(
      {this.height,
      this.width,
      this.path,
      this.file,
      this.color,
      this.dColor,
      this.isOnline = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    if (file != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(height / 2),
        child: Image.file(
          file,
          width: width,
          height: height,
          fit: BoxFit.fill,
        ),
      );
    } else if (path.contains("http")) {
      return GestureDetector(
        onTap: onTap,
        child: CachedNetworkImage(
          imageUrl: path,
          imageBuilder: (context, imageProvider) => Container(
            width: width,
            height: height,
            child: Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: color != null ? color : Colors.transparent,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Visibility(
                  visible: isOnline,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          width: width > 100 ? 30 : 20,
                          height: height > 100 ? 30 : 20,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                //                   <--- border color
                                width: 3.0,
                              )))),
                )
              ],
            ),
          ),
          placeholder: (context, url) => Container(
            width: width,
            height: height,
            child: SvgPicture.asset(appIcon),
          ),
          errorWidget: (context, url, error) => Container(
            width: width,
            height: height,
            child: SvgPicture.asset(appIcon),
          ),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: color != null ? color : Colors.transparent,
            child: path.contains(".svg")
                ? SvgPicture.asset(
                    path,
                    width: width,
                    color: dColor,
                    height: height,
                  )
                : Image.asset(
                    path,
                    width: width,
                    height: height,
                  ),
          ),
        ),
      );
    }
  }
}
