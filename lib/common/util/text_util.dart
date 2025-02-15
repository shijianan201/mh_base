import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class TextUtil {
  static bool isMobilePhoneNumber(String text) {
    var res = PhoneNumber.parse(text);
    return res.isValid(type: PhoneNumberType.mobile);
  }
}
