import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ImageSourceFrom {
  network,
  assets,
  file,
}

class UserAvatar extends StatelessWidget {
  final String urlOrPath;
  ImageSourceFrom sourceFrom = ImageSourceFrom.network;
  double size;
  BoxFit? fit;
  double borderWidth = 1;
  Color borderColor = Colors.white;
  String? defaultAvatarAssetsPath;
  String? errorAvatarAssetsPath;

  UserAvatar(
      {super.key,
      required this.urlOrPath,
      this.size = 40,
      this.fit = BoxFit.cover,
      this.borderColor = Colors.white,
      this.borderWidth = 1,
      this.sourceFrom = ImageSourceFrom.network,
      this.errorAvatarAssetsPath,
      this.defaultAvatarAssetsPath});

  @override
  Widget build(BuildContext context) {
    var mSize = size - 2 * borderWidth;
    Widget child;
    if (sourceFrom == ImageSourceFrom.network) {
      child = CachedNetworkImage(
          errorWidget: (a, b, c) {
            if (errorAvatarAssetsPath == null) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(mSize / 2),
                child: Container(
                  width: mSize,
                  height: mSize,
                  child: Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                      size: mSize / 2,
                    ),
                  ),
                ),
              );
            } else {
              return ClipRRect(
                borderRadius: BorderRadius.circular(mSize / 2),
                child: Image.asset(
                  errorAvatarAssetsPath!,
                  width: mSize,
                  height: mSize,
                  fit: BoxFit.fill,
                ),
              );
            }
          },
          placeholder: (a, b) {
            if (defaultAvatarAssetsPath == null) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(mSize / 2),
                child: Container(
                  color: Colors.grey,
                  width: mSize,
                  height: mSize,
                  child: Center(
                    child: SizedBox(
                      width: mSize / 3,
                      height: mSize / 3,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              );
            } else {
              return ClipRRect(
                borderRadius: BorderRadius.circular(mSize / 2),
                child: Image.asset(defaultAvatarAssetsPath!,
                    width: mSize, height: mSize, fit: BoxFit.fill),
              );
            }
          },
          fit: fit ?? BoxFit.cover,
          width: mSize,
          height: mSize,
          imageUrl: urlOrPath);
    } else if (sourceFrom == ImageSourceFrom.assets) {
      child = Image.asset(
        urlOrPath,
        fit: fit ?? BoxFit.cover,
        width: mSize,
        height: mSize,
      );
    } else if (sourceFrom == ImageSourceFrom.file) {
      child = Image.file(
        File(urlOrPath),
        fit: fit ?? BoxFit.cover,
        width: mSize,
        height: mSize,
      );
    }else{{
      child = SizedBox(
        width: mSize,
        height: mSize,
      );
    }}
    return SizedBox(
      width: size,
      height: size,
      child: CircleAvatar(
        child: Container(
          width: size,
          height: size,
          padding: EdgeInsets.all(borderWidth),
          decoration: BoxDecoration(
            color: borderColor,
            shape: BoxShape.circle,
          ),
          child: CachedNetworkImage(
              errorWidget: (a, b, c) {
                if (errorAvatarAssetsPath == null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(mSize / 2),
                    child: Container(
                      width: mSize,
                      height: mSize,
                      child: Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: mSize / 2,
                        ),
                      ),
                    ),
                  );
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(mSize / 2),
                    child: Image.asset(
                      errorAvatarAssetsPath!,
                      width: mSize,
                      height: mSize,
                      fit: BoxFit.fill,
                    ),
                  );
                }
              },
              placeholder: (a, b) {
                if (defaultAvatarAssetsPath == null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(mSize / 2),
                    child: Container(
                      color: Colors.grey,
                      width: mSize,
                      height: mSize,
                      child: Center(
                        child: SizedBox(
                          width: mSize / 3,
                          height: mSize / 3,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  );
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(mSize / 2),
                    child: Image.asset(defaultAvatarAssetsPath!,
                        width: mSize, height: mSize, fit: BoxFit.fill),
                  );
                }
              },
              fit: fit ?? BoxFit.cover,
              width: mSize,
              height: mSize,
              imageUrl: urlOrPath),
        ),
      ),
    );
  }
}
