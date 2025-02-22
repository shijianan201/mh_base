
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mh_base/common/image/mh_image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SingleImagePickerBox extends StatefulWidget{

  final String defaultImagePath;
  final GestureTapCallback? onTap;

  const SingleImagePickerBox({super.key, required this.defaultImagePath, this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _SingleImagePickerBoxState();
  }
}

class _SingleImagePickerBoxState extends State<SingleImagePickerBox>{

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 176,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffd9d9d9),
            ),
            borderRadius: BorderRadius.circular(4),
            color: Color(0xfffefefe)
        ),
        child: Center(
          child: Image.asset(widget.defaultImagePath,width: 32,height: 32,),
        ),
      ),
    );
  }

}