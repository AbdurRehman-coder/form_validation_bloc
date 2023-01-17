
import 'package:bloc_rohit_semriwal/sign_in/bloc/sgin_in_bloc.dart';
import 'package:bloc_rohit_semriwal/sign_in/bloc/sign_in_events.dart';
import 'package:bloc_rohit_semriwal/sign_in/bloc/sign_in_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in Screen'),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SignInBloc, SignInStates>(
              builder: (context, state) {
                if(state is SignInErrorState) {
                  return Text(state.errorMessage,
                    style: TextStyle(color: Colors.redAccent),);
                } else{
                  return Container();
                }
              }
            ),
            SizedBox(height: 20,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
              onChanged: (value){
                BlocProvider.of<SignInBloc>(context).add(
                  SignInEmailTextEvent(emailController.text,),);
              },
            ),
            SizedBox(height: 16,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
              onChanged: (value){
                BlocProvider.of<SignInBloc>(context).add(
                    SignInPasswordTextEvent(passwordController.text,),
                );
              },
            ),
            SizedBox(height: 40,),
            BlocBuilder<SignInBloc, SignInStates>(
              builder: (context, state) {
                print('button state: $state');
                return Container(
                  width: MediaQuery.of(context).size.width,
                  color: (state is SignInValidState && state is !SignInErrorState) ? Colors.green : Colors.grey,
                  child: CupertinoButton(
                      child: (state is SignInLoadingState)
                    ? const Center(
                        child: CupertinoActivityIndicator(color: Colors.white,),
                      )
                      : const Text('Sign in',
                        style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        if(state is SignInValidState){
                          print('button pressed: ${emailController.text} ,, ${passwordController.text}');
                          BlocProvider.of<SignInBloc>(context).add(SignInSubmittedEvent(emailController.text, passwordController.text));
                        }
                      }),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
