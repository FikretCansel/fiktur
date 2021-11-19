class LoginValidationMixin{
  validateEmail(String email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

    if(!emailValid){
      return "Geçerli email Giriniz";
    }

  }
  validatePassword(String password){
    if(password.length<6){
      return "Şifre 6 karakterden büyük olmalıdır";
    }
  }
}