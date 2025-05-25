extension MapExt on Map<String, dynamic>? {
  Map<String, dynamic> ignoreNull() {
    if (this == null) {
      return {};
    }
    var newMap = <String, dynamic>{};
    this!.forEach((key, value) {
      if (value != null) {
        newMap[key] = value;
      }
    });
    return newMap;
  }
}
