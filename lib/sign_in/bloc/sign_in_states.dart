

abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInValidState extends SignInStates {}

class SignInErrorState extends SignInStates {
  String errorMessage;
  SignInErrorState(this.errorMessage);
}

class SignInLoadingState extends SignInStates {}