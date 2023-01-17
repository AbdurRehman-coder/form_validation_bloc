

abstract class SignInEvent{}

class SignInEmailTextEvent extends SignInEvent {
  final String emailValue;
  /// Constructor for values initialization
  SignInEmailTextEvent(this.emailValue,);
}

class SignInPasswordTextEvent extends SignInEvent{
  final String passwordValue;
  SignInPasswordTextEvent(this.passwordValue);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(this.email, this.password);
}