class Validators {
  /// validate empty string
  static String? isEmpty({required String? string}) {
    return string == null || string.isEmpty ? "* required" : null;
  }

  /// password validator
  static String? validatePassword({required String string}) {
    if (string.isEmpty) {
      return "* required";
    } else if (string.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (string.length > 15) {
      return "Password should not be greater than 15 characters";
    } else {
      return null;
    }
  }

  static String? confirmPassword(
      {required String password, required String cPassword}) {
    if (password == cPassword) {
      return null;
    } else {
      return "Passwords do not match.";
    }
  }

  ///  string validator
  static String? isString({required String? string, int? length}) {
    String regex = r'([a-zA-Z])$';
    if (string == null || string.isEmpty) {
      return "* required";
    } else if (!validRegexExp(regex, string)) {
      return "Strings only";
    } else {
      return null;
    }
  }

  /// postal code validator
  ///Source: https://github.com/unicode-org/cldr/blob/release-26-0-1/common/supplemental/postalCodeData.xml
  static String? isPostalCode({required String? string}) {
    // example : a1a 1a1
    String regexWithSpaceForCA =
        r'^([ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy]\d[ABCEGHJKLMNPRSTVWXYZabceghjklmnprstvwxyz])\ {0,1}(\d[ABCEGHJKLMNPRSTVWXYZabceghjklmnprstvwxyz]\d)$';
    // example : a1a1a1
    String regexWithOutSpaceForCA =
        r'^([ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy]\d[ABCEGHJKLMNPRSTVWXYZabceghjklmnprstvwxyz]\d[ABCEGHJKLMNPRSTVWXYZabceghjklmnprstvwxyz]\d)$';
    if (string == null || string.isEmpty) {
      return "* required";
    } else if (!validRegexExp(regexWithSpaceForCA, string) &&
        !validRegexExp(regexWithOutSpaceForCA, string)) {
      return "Invalid postal code";
    } else {
      return null;
    }
  }

  /// email validator
  static String? isEmail({required String? string}) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (string == null || string.isEmpty) {
      return "* required";
    } else if (!validRegexExp(regex, string)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  ///  number validator
  static String? isPhoneNumber({required String? string, int? length}) {
    if (string == null || string.isEmpty) {
      return "* required";
    }
    // else if (!GetUtils.isPhoneNumber(string)) {
    //   return "Invalid phone number";
    // }
    else {
      return null;
    }
  }

  ///  number validator
  static String? isNumber({required String? string, int? length}) {
    if (string == null || string.isEmpty) {
      return "* required";
    }
    // else if (!GetUtils.isNumericOnly(string)) {
    //   return "Number only";
    // }
    else {
      return null;
    }
  }

  ///  number validator
  static String? isDecimalNumber({required String? string, int? length}) {
    if (string == null || string.isEmpty) {
      return "* required";
    }
    // else if (!GetUtils.isNum(string)) {
    //   return "Decimal number only";
    // }
    else {
      return null;
    }
  }

  /// validate min length
  static String? validateMinLength(
      {required String string, required int length}) {
    return (string.length < length && string.isEmpty)
        ? "It must be greate than $length characters"
        : null;
  }

  /// validate max length
  static String? validateMaxLength({required String string, int length = 4}) {
    return string.length > length
        ? "It must not exceed $length characters"
        : null;
  }

  /// validate min-max length
  static String? validateMinMaxLength(
      {required String? string, int minLegth = 1, int maxLength = 10}) {
    if (string == null || string.isEmpty) {
      return "* required";
    } else if (string.length < minLegth || string.length > maxLength) {
      return minLegth == maxLength
          ? "It must be $minLegth characters"
          : "It must be between $minLegth and $maxLength characters";
    } else {
      return null;
    }
  }

  /// validate min-max length with regex
  static String? validateMinMaxLengthWithRegex(
      {required String? string,
      int minLegth = 1,
      int maxLength = 10,
      required String regex,
      String regexMessage = "Invalid data"}) {
    if (string == null || string.isEmpty) {
      return "* required";
    } else if (string.length < minLegth || string.length > maxLength) {
      return minLegth == maxLength
          ? "It must be $minLegth characters"
          : "It must be between $minLegth and $maxLength characters";
    } else if (!validRegexExp(regex, string)) {
      return regexMessage;
    } else {
      return null;
    }
  }

  /// validate regex for the string
  static bool validRegexExp(String regex, String string) {
    return RegExp(regex).hasMatch(string);
  }
}
