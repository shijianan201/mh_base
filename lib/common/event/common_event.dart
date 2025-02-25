import 'package:flutter/widgets.dart';


enum EventType {
  none,
}

class CommonEvent {
  final EventType eventType;
  dynamic extra;
  dynamic extra2;
  dynamic extra3;

  CommonEvent(this.eventType, {this.extra, this.extra2, this.extra3});
}