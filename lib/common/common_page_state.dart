import 'package:flutter/cupertino.dart';

abstract class CommonPageState<P extends StatefulWidget> extends State<P> {
  @override
  void initState() {
    super.initState();
  }

  void doOnNextFrame(Function(Duration) onNextFrameCome) {
    WidgetsBinding.instance.addPostFrameCallback((a) {
      onNextFrameCome.call(a);
    });
  }
}
