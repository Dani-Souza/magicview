


class PasswordValidator{
    String? validate ({String? password}) {
    if (password == null || password == '') {
      return 'password is mandatory' ; 
    }
    if (password.length < 6){
      return 'return error message if password is less than 6 characters';
    }
  
  final alphanumeric = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9]).+$');
  if(!alphanumeric.hasMatch(password)) {
    return 'the password must be alphanumeric';

  }
  return null;

  }
 }