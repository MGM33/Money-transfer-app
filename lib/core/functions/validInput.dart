import 'package:get/get.dart';

String? validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Value can't be empty";
  }
  if (val.length < min) {
    return "Value can't be less than $min characters";
  }
  if (val.length > max) {
    return "Value can't be more than $max characters";
  }
  
  switch (type) {
    case "phonenumber":
      if (!GetUtils.isPhoneNumber(val)) {
        return "Not a valid phone number";
      }
      break;
    case "userName":
      if (!GetUtils.isUsername(val)) {
        return "Not a valid username";
      }
      break;
    case "amount":
      if (!GetUtils.isNum(val)) {
        return "Not a valid amount";
      }
      final numValue = num.tryParse(val);
      if (numValue == null || numValue <= 0) {
        return "Amount must be greater than zero";
      }
      break;
    // default:
    //   return "Invalid type specified";
  }
  return null; // Return null if validation passes
}
