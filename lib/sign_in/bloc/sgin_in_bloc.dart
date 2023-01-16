

import 'package:bloc_rohit_semriwal/sign_in/bloc/sign_in_events.dart';
import 'package:bloc_rohit_semriwal/sign_in/bloc/sign_in_states.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInStates> {
  SignInBloc() : super(SignInInitialState()){
    on<SignInEmailTextEvent>((event, emit){
      if(EmailValidator.validate(event.emailValue) == false){
        emit(SignInErrorState('Please enter a valid email address'));
      }
      // else if(event.passwordValue.length < 8){
      //   emit( SignInErrorState('Please enter a valid password'));
      // }
      else{
        emit(SignInValidState());
      }
    });
    on<SignInPasswordTextEvent>((event, emit){
      if(event.passwordValue.length < 8){
        emit(SignInErrorState('Please enter a valid password'));
      } else{
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });

  }

}