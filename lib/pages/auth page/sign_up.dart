import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/constant/const.dart';
import 'package:shopping_app/pages/auth%20page/auth_controller.dart';
import 'package:shopping_app/pages/auth%20page/bloc/auth_bloc.dart';
import 'package:shopping_app/pages/auth%20page/bloc/auth_event.dart';
import 'package:shopping_app/pages/auth%20page/bloc/auth_state.dart';
import 'package:shopping_app/pages/auth%20page/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _password;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) => Container(
        color: kBgColor,
        child: SafeArea(
            child: Scaffold(
          appBar: buildAppbar('ثبت نام'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "مشخصات خود را وارد کنید",
                      textScaleFactor: 0.7,
                      style: kmediumTextStyle.copyWith(
                        color: kSecondColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 65.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('نام کاربری',
                            style: kmediumTextStyle.copyWith(
                              color: kSecondColor,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            // username input
                            onChanged: (value) {
                              context
                                  .read<AuthBloc>()
                                  .add(NewUsernameEvent(value));
                            },
                            showCursor: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: kFirstColor),
                                  borderRadius: BorderRadius.circular(25)),
                              hintTextDirection: TextDirection.rtl,
                              hintText: 'نام کاربری خود را وارد نمایید',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                    color: kSecondColor,
                                  )),
                              icon: const Icon(
                                Icons.person,
                                color: kBottomColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('ایمیل',
                            style: kmediumTextStyle.copyWith(
                              color: kSecondColor,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            // email input
                            onChanged: (value) {
                              context
                                  .read<AuthBloc>()
                                  .add(NewEmailEvent(value));
                            },
                            showCursor: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: kFirstColor),
                                  borderRadius: BorderRadius.circular(25)),
                              hintTextDirection: TextDirection.rtl,
                              hintText: 'ایمیل خود را وارد نمایید',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                    color: kSecondColor,
                                  )),
                              icon: const Icon(
                                Icons.email_outlined,
                                color: kBottomColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'رمز عبور',
                          style: kmediumTextStyle.copyWith(
                            color: kSecondColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            // password input
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                            autocorrect: false,
                            obscureText: true,
                            showCursor: false,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: kFirstColor),
                                  borderRadius: BorderRadius.circular(25)),
                              hintTextDirection: TextDirection.rtl,
                              hintText: 'رمز عبور خود را وارد نمایید',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                    color: kSecondColor,
                                  )),
                              icon: const Icon(
                                Icons.lock,
                                color: kBottomColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'تایید رمز عبور',
                          style: kmediumTextStyle.copyWith(
                            color: kSecondColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            // confirm password input
                            onChanged: (value) {
                              if (value == _password) {
                                context
                                    .read<AuthBloc>()
                                    .add(NewPasswordEvent(value));
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'رمز عبور های وارد شده مطابقت ندارند');
                              }
                            },
                            autocorrect: false,
                            obscureText: true,
                            showCursor: false,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: kFirstColor),
                                  borderRadius: BorderRadius.circular(25)),
                              hintTextDirection: TextDirection.rtl,
                              hintText: 'رمز عبور خود را مجدد وارد نمایید',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                    color: kSecondColor,
                                  )),
                              icon: const Icon(
                                Icons.lock,
                                color: kBottomColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(context, 'LoginPage');
                            },
                            child: Text(
                              'قبلا ثبت نام کرده اید؟ وارد شوید',
                              style: kmediumTextStyle.copyWith(
                                  color: kSecondColor,
                                  decoration: TextDecoration.underline),
                            )),
                        const SizedBox(
                          height: 35,
                        ),
                        /*Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kBottomColor,
                                  fixedSize: Size(325.w, 50.h)),
                              onPressed: () {
                                
                              },
                              child: Text(
                                'ورود',
                                style:
                                    kmediumTextStyle.copyWith(color: kBgColor),
                              )),
                        ),*/
                        const SizedBox(
                          height: 35,
                        ),
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kBottomColor,
                                  fixedSize: Size(325.w, 50.h)),
                              onPressed: () {
                                AuthController(context: context).b4aSignup();
                              },
                              child: Text(
                                'ثبت نام',
                                style:
                                    kmediumTextStyle.copyWith(color: kBgColor),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
