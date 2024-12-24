class LoginModel {
  String phonenumber;
  String password;

  LoginModel({required this.phonenumber, required this.password});

  // دالة للتحقق من صحة البيانات قبل إرسالها
  bool isValid() {
    if (phonenumber.isEmpty || password.isEmpty) {
      return false; 
    }

    // التحقق من صحة رقم الهاتف
    if (!RegExp(r'^\+9639\d{8}$').hasMatch(phonenumber)) {
      return false; 
    }

    // التحقق من أن طول الرقم هو 12 (بما في ذلك +963)
    if (phonenumber.length != 12) {
      return false; 
    }

    // التحقق من كلمة المرور
    if (!validatePassword(password)) {
      return false; 
    }

    return true; // إذا كانت كل الشروط صحيحة
  }

  // دالة للتحقق من صحة كلمة المرور
  bool validatePassword(String value) {
    if (value.length < 8) {
      return false; 
    }

    // تحقق من وجود أحرف كبيرة وصغيرة وأرقام ورموز
    RegExp lowerCase = RegExp(r'[a-z]');
    RegExp upperCase = RegExp(r'[A-Z]');
    RegExp numbers = RegExp(r'[0-9]');
    RegExp specialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (!lowerCase.hasMatch(value)) {
      return false; 
    }
    if (!upperCase.hasMatch(value)) {
      return false; 
    }
    if (!numbers.hasMatch(value)) {
      return false; 
    }
    if (!specialChars.hasMatch(value)) {
      return false; 
    }

    return true; // كلمة المرور صحيحة
  }

  Map<String, dynamic> toJson() {
    return {
      'phonenumber': phonenumber,
      'password': password,
    };
  }
}
