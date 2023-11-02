class AuthState {
  final String email;
  final String password;
  final String newUserName;
  final String newEmail;
  final String newPassword;

  const AuthState(
      {this.newUserName = '',
      this.newEmail = '',
      this.newPassword = '',
      this.email = '',
      this.password = ''});

  AuthState getEmailandPassword({
    String? email,
    String? password,
    String? newUserName,
    String? newEmail,
    String? newPassword,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      newUserName: newUserName ?? this.newUserName,
      newEmail: newEmail ?? this.newEmail,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}
