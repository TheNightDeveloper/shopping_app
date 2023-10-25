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
