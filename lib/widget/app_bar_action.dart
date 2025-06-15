import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mh_base/common/common_page.dart';
import 'package:mh_base/widget/mh_inkwell.dart';

class AppBarActionView extends StatelessWidget {
  final AppBarAction action;

  const AppBarActionView({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    var child = action.childBuilder?.call(context);
    if (child == null) {
      var icon = action.icon;
      if (icon is IconData) {
        child = Icon(
          icon,
          size: 24,
          color: Color(0xff666666),
        );
      } else if (icon is String) {
        child = Image.asset(
          icon,
          width: 24,
          height: 24,
          fit: BoxFit.fill,
        );
      } else {
        child = Padding(
          padding: EdgeInsets.symmetric(
            vertical: 4,
          ),
          child: Text(
            "${action.name}",
            style: TextStyle(fontSize: 14, color: Color(0xff666666)),
          ),
        );
      }
    }
    return MhInkWell(
      onTap: () {
        action.onTap?.call();
      },
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(minHeight: 24),
        child: child,
      ),
    );
  }
}
