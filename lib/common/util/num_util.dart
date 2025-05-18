
extension NumExt on num?{

  double? toProgressDouble(){
    if(this == null){
      return null;
    }
    return this!.toDouble() / 100;
  }

}