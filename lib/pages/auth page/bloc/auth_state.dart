class AuthState {
  final String email;
  final String password;
  const AuthState({this.email = '', this.password = ''});

  AuthState getEmailandPassword({String? email, String? password}) {
    return AuthState(
        email: email!, password: password!);
  }
}
