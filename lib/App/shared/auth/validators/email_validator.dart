class EmailValidator {
  String? Validate({String? email}) {
    if (email == null || email == '') {
      return 'Por favor digite seu E-mail';
    }

    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+");
    if (!emailRegex.hasMatch(email)) {
      return 'E-mail não é válido';
    }

    return null;
  }
}
