import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';

class AuthController {
  final BuildContext context;

  AuthController({required this.context});

  void handleAuth(String type) async {
    try {
      if (type == "email") {
        // using this code instead of BlocProvider.of<AuthBloc>(context).state
        final state = context.read<AuthBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {}
        if (password.isEmpty) {}
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          var user = credential.user;
          if (user == null) {
            //  user not exist
          }
          if (!user!.emailVerified) {
            // user didnt verify his/her email
          }
          if (user != null) {
            // user verify from firebase
          } else {
            // get error from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
