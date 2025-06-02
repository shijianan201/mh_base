import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class MhInkWell extends StatelessWidget {
  final Widget? child;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapCallback? onTap;
  Duration cooldownDuration = Duration(milliseconds: 1000);

  MhInkWell(
      {super.key,
      this.child,
      this.onDoubleTap,
      this.onLongPress,
      this.onTap,
      this.cooldownDuration = const Duration(milliseconds: 1000)});

  @override
  Widget build(BuildContext context) {
    return TapDebouncer(
        onTap: () async {
          onTap?.call();
        },
        cooldown: cooldownDuration,
        builder: (ctx, onTap) {
          return InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            onDoubleTap: onDoubleTap,
            child: child,
          );
        });
  }
}
