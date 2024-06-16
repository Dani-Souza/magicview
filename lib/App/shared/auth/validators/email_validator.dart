class EmailValidator {
  String? Validate({String? email}) {
if (email == null || email == ''){
  return 'Email is mandatory';
}

  final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+");
  if(!emailRegex.hasMatch(email)) {
    return 'Email is invalid';
  }

  return null;
}
}