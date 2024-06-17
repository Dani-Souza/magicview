class PasswordValidator {
  String? validate({String? password}) {
    if (password == null || password == '') {
      return 'Preencha a senha';
    }
    if (password.length < 6) {
      return 'A senha deve ter no minimo 6 caracteres';
    }

    final alphanumeric = RegExp(r'^(?=.*[0-9]).+$');
    if (!alphanumeric.hasMatch(password)) {
      return 'A senha deve ser alfanumérica';
    }
    return null;
  }
}
