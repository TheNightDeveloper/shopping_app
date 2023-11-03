import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:shopping_app/common/constant/const.dart';

import 'bloc/auth_bloc.dart';
import 'widgets/widgets.dart';

class AuthController {
  final BuildContext context;

  AuthController({required this.context});

  void loginHandler(String type) async {
    try {
      if (type == "email") {
        // using this code instead of BlocProvider.of<AuthBloc>(context).state
        final state = context.read<AuthBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        /*if (emailAddress.isEmpty) {
          Fluttertoast.showToast(
              msg: 'ایمیل خود را وارد نمایید', backgroundColor: kSecondColor);
        } else {
          print('email is $emailAddress');
        }
        if (password.isEmpty) {
          Fluttertoast.showToast(
              msg: 'رمز عبور خورا وارد نمایید', backgroundColor: kSecondColor);
        } else {
          print('pass is $password');
        }*/
        //
        if (emailAddress.isNotEmpty && password.isNotEmpty) {
          try {
            final credential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: emailAddress, password: password);
            var user = credential.user;
            if (user == null) {
              //  user not exist
              print('user not exist');
            }
            if (!user!.emailVerified) {
              // user didnt verify his/her email
            }
            if (user != null) {
              // user verify from firebase
              print('user exist');
            } else {
              // get error from firebase
              print('no user');
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              Fluttertoast.showToast(msg: 'کاربری پیدا نشد');
            } else if (e.code == 'wrong-password') {
              Fluttertoast.showToast(msg: ' رمز عبور اشتباه است');
            } else if (e.code == 'invalid-email') {
              Fluttertoast.showToast(msg: 'ایمیل اشتباه است');
            } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
              Fluttertoast.showToast(msg: 'ایمیل یا رمز عبور اشتباه است');
            } else {
              print("error :${e.message}");
            }
          }
        } else {
          Fluttertoast.showToast(msg: 'ایمیل و رمز عبور خود را وارد نمایید');
        }
      }
    } catch (e) {}
  }

  void b4aSignup() async {
    try {
      final state = context.read<AuthBloc>().state;
      String newEmailAddress = state.newEmail;
      String newPassword = state.newPassword;
      String newUsername = state.newUserName;
      if (newEmailAddress.isNotEmpty && newPassword.isNotEmpty) {
        try {
          final user =
              ParseUser.createUser(newUsername, newPassword, newEmailAddress);
          var response = await user.signUp();

          if (response.success) {
            print(response.result);
          } else {
            print(response.error!.message);
          }
        } catch (e) {}
      }
    } catch (e) {}
  }

  void b4aLogin() async {
    try {
      final state = context.read<AuthBloc>().state;
      String emailAddress = state.email;
      String password = state.password;

      if (emailAddress.isNotEmpty && password.isNotEmpty) {
        try {
          final user = ParseUser(emailAddress, password, emailAddress);
          var response = await user.login();

          if (response.success) {
            print(user.sessionToken);
            storageService.setString(storageUserTokenkey, user.sessionToken!);
            showSuccess("User was successfully login!", context);
          } else {
            showError(response.error!.message, context);
          }
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void signUpHandler() async {
    try {
      final state = context.read<AuthBloc>().state;
      String newEmailAddress = state.newEmail;
      String newPassword = state.newPassword;
      String newUsername = state.newUserName;

      if (newEmailAddress.isNotEmpty && newPassword.isNotEmpty) {
        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: newEmailAddress, password: newPassword);
          var user = credential.user;
          if (user != null) {
            // user verify from firebase
            await user.sendEmailVerification();
            await user.updateDisplayName(newUsername);
            Fluttertoast.showToast(
                msg:
                    "ایمیل تایید برای شما ارسال شد.هم اکنون ایمیل خود راچک کنید");
            Navigator.pop(context);
          }
        } on FirebaseAuthException catch (error) {
          switch (error.code) {
            case "email-already-in-use":
              {
                Fluttertoast.showToast(msg: 'ایمیل قبلا ثبت شده');
                break;
              }
            case "invali-email":
              {
                Fluttertoast.showToast(msg: 'ایمیل نامعتبر است');
                break;
              }
            case "operation-not-allowed":
              {
                Fluttertoast.showToast(msg: 'حساب کاربری غیرفعال است');
                break;
              }
            case "weak-password":
              {
                Fluttertoast.showToast(msg: 'گذرواژه ضعیف است');
                break;
              }
            default:
              {
                print('Error : ${error.message}');
                break;
              }
          }
        }
      } else {
        Fluttertoast.showToast(msg: 'ایمیل و رمز عبور خود را وارد نمایید');
      }
    } catch (e) {}
  }
}
