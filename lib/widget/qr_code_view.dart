
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeView extends StatelessWidget{

  final String text;

  const QrCodeView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return QrImageView(data: text);
  }

}