
import 'package:flutter/widgets.dart';

class KeepAlivePage extends StatefulWidget{

  final Widget child;

  const KeepAlivePage({super.key, required this.child});

  @override
  State<StatefulWidget> createState() {
    return _KeepAlivePageState();
  }

}

class _KeepAlivePageState extends State<KeepAlivePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}