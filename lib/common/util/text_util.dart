import 'package:email_validator/email_validator.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class TextUtil {
  static bool isMobilePhoneNumber(String text) {
    var res = PhoneNumber.parse(text);
    return res.isValid(type: PhoneNumberType.mobile);
  }

  static bool isEmail(String text) {
    var res = EmailValidator.validate(text);
    return res;
  }
}
