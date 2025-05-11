import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mh_base/widget/user_avatar.dart';

class MhImage extends StatelessWidget {
  final String? urlOrPath;
  ImageSourceFrom sourceFrom = ImageSourceFrom.network;
  double? width;
  double? height;
  double? radius;
  BoxFit? fit;
  double borderWidth = 1;
  Color borderColor = Colors.white;
  String? defaultAvatarAssetsPath;
  String? errorAvatarAssetsPath;

  MhImage(
      {super.key,
      required this.urlOrPath,
      this.width,
      this.height,
      this.radius,
      this.fit = BoxFit.cover,
      this.borderColor = Colors.white,
      this.borderWidth = 1,
      this.sourceFrom = ImageSourceFrom.network,
      this.errorAvatarAssetsPath,
      this.defaultAvatarAssetsPath});

  @override
  Widget build(BuildContext context) {
    var path = urlOrPath;
    if (path == null || path.isEmpty) {
      return Container(
        width: width,
        height: height,
        color: Colors.grey,
      );
    }
    var error = errorAvatarAssetsPath == null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: Container(
              width: width,
              height: height,
              child: Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 24,
                ),
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: Image.asset(
              errorAvatarAssetsPath!,
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
          );
    Widget child;
    if (sourceFrom == ImageSourceFrom.network) {
      child = CachedNetworkImage(
          errorWidget: (a, b, c) {
            return error;
          },
          placeholder: (a, b) {
            if (defaultAvatarAssetsPath == null) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(radius ?? 0),
                child: Container(
                  color: Colors.grey,
                  width: width,
                  height: height,
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            } else {
              return ClipRRect(
                borderRadius: BorderRadius.circular(radius ?? 0),
                child: Image.asset(defaultAvatarAssetsPath!,
                    width: width, height: height, fit: BoxFit.fill),
              );
            }
          },
          fit: fit ?? BoxFit.cover,
          width: width,
          height: height,
          imageUrl: path);
    } else if (sourceFrom == ImageSourceFrom.assets) {
      child = Image.asset(
        path,
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      );
    } else if (sourceFrom == ImageSourceFrom.file) {
      child = Image.file(
        File(path),
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      );
    } else {
      child = SizedBox(
        width: width,
        height: height,
      );
    }
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        color: borderColor,
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: child,
      ),
    );
  }
}
