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

  static String? formatSecretPhoneNumber(String phoneNumber){
    if(phoneNumber.length < 5){
      return phoneNumber;
    }else{
      return phoneNumber.replaceRange(2, phoneNumber.length - 3, '***');
    }
  }

  static String? formatSecretEmail(String email){
    var lastIndex = email.lastIndexOf('@');
    if(lastIndex < 0){
      return email.replaceRange(3, email.length, "***");
    }else{
      return email.replaceRange(3, lastIndex, "***");
    }
  }
}
