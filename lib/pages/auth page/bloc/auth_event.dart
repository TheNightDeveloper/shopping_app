abstract class AuthEvents {
  const AuthEvents(); 
}

class EmailEvent extends AuthEvents{
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends AuthEvents{
  final String password;
  PasswordEvent(this.password); 
}
class NewUsernameEvent extends AuthEvents{
  final String newUsername;
  NewUsernameEvent(this.newUsername);
}
class NewEmailEvent extends AuthEvents{
  final String newEmail;
  NewEmailEvent(this.newEmail);
}
class NewPasswordEvent extends AuthEvents{
  final String newPass;
  NewPasswordEvent(this.newPass);
}