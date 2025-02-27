import 'dart:async';

import 'package:event_bus/event_bus.dart';

import 'common_event.dart';

void sendCommonEvent(int eventType,
    {dynamic extra, dynamic extra2, dynamic extra3}) {
  MhEventBus.instance
      .sendCommonEvent(eventType, extra: extra, extra2: extra2, extra3: extra3);
}

class MhEventBus {
  MhEventBus._internal();

  static final MhEventBus _instance = MhEventBus._internal();

  factory MhEventBus() => _instance;

  static MhEventBus get instance => _instance;

  EventBus eventBus = EventBus();

  void sendEvent(dynamic event) {
    eventBus.fire(event);
  }

  void sendCommonEvent(int eventType,
      {dynamic extra, dynamic extra2, dynamic extra3}) {
    eventBus.fire(
        CommonEvent(eventType, extra: extra, extra2: extra2, extra3: extra3));
  }

  StreamSubscription<T> listen<T>(void Function(T event) onData) {
    return eventBus.on<T>().listen(onData);
  }
}

abstract mixin class EventOwner {
  final List<StreamSubscription> eventSubscriptions = [];

  bool enableEventBus() {
    return false;
  }

  void listenEvent<T>() {
    if(!enableEventBus()){
      return;
    }
    var res = MhEventBus.instance.listen<T>((event) {
      if (event is CommonEvent) {
        onReceiveCommonEvent(event);
      } else {
        onReceiveEvent(event);
      }
    });
    eventSubscriptions.add(res);
  }

  void listenEventByCallback<T>(Function(T event) callback) {
    if(!enableEventBus()){
      return;
    }
    var res = MhEventBus.instance.listen<T>((event) {
      callback.call(event);
    });
    eventSubscriptions.add(res);
  }

  void onReceiveCommonEvent(CommonEvent event);

  void onReceiveEvent(dynamic event);

  void releaseAllEvents() {
    if(!enableEventBus()){
      return;
    }
    for (var element in eventSubscriptions) {
      element.cancel();
    }
    eventSubscriptions.clear();
  }
}
