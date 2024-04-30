class MyValidator{
  static String? validateEmptyText(String? fieldName, String? value){
    if(value == null || value.isEmpty){
      return'$fieldName ожидается';
    }

    return null;
  }

  static String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return 'Email ожидается';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if(!emailRegExp.hasMatch(value)){
      return 'Неправильный Email';
    }

    return null;
  }

  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'Пароль ожидается.';
    }

    if(value.length < 6){
      return 'Пароль должен иметь минимум 6 символов';
    }

    if(!value.contains(RegExp(r'[A-Z]'))){
      return 'Ваш пароль должен содержать хотя бы одну заглавную букву';
    }

    if(!value.contains(RegExp(r'[0-9]'))){
      return 'Ваш пароль должен содержать хотя бы одну цифру';
    }

    if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return 'Пароль должен содержать хотя бы одну цифру';
    }

    return null;
  }

  static String? phoneNumber(String? value){
    if(value == null || value.isEmpty){
      return 'Номер телефона ожидается';
    }

    //10 numbers
    final phoneRegExp = RegExp(r'^\d{12}$');

    if(!phoneRegExp.hasMatch(value)){
      return "Неверный формат номера телефона (12 цифр)";
    }

    return null;
  }


}