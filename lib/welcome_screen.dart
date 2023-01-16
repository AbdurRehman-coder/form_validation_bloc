

import 'package:bloc_rohit_semriwal/sign_in/bloc/sgin_in_bloc.dart';
import 'package:bloc_rohit_semriwal/sign_in/sign_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'welcome'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 200,),
            Text('Form Validation'),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent,
              child: CupertinoButton(
                  child: const Text('Sign in with email',
                    style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider(
                      create: (context) => SignInBloc(),
                        child: SignInScreen(),
                    ),),);
                  }),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent,
              child: CupertinoButton(
                  child: const Text('Sign in with google',
                  style: TextStyle(color: Colors.white),),
                  onPressed: (){}),
            ),
          ],

        ),
      ),
    );
  }
}
