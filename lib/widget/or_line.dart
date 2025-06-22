import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrLine extends StatelessWidget {
  final String text;
  final Color? lineColor;
  final TextStyle? textStyle;
  final double? intent;
  final double? endIntent;

  const OrLine({super.key, required this.text, this.lineColor, this.textStyle, this.intent, this.endIntent});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(width: intent,),
        Expanded(
            child: Divider(
          color: Color(0xffc2c2c2),
          height: 1,
        )),
        SizedBox(
          width: 12,
        ),
        Text(
          text,
          style: textStyle ?? TextStyle(fontSize: 14, color: Color(0xff999999)),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
            child: Divider(
          color: Color(0xffc2c2c2),
          height: 1,
        )),
        SizedBox(width: endIntent,),
      ],
    );
  }
}
