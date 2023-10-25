import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/pages/auth%20page/widgets/widgets.dart';

import '../../constant/const.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBgColor,
      child: SafeArea(
          child: Scaffold(
        appBar: buildAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                thirdPartyLogin(context),
                Center(
                  child: Text(
                    "و یا برای ورود از ایمیل و رمز عبور خود استفاده کنید",
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
                              Icons.person,
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
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'فراموشی رمز عبور',
                            style: kmediumTextStyle.copyWith(
                                color: kSecondColor,
                                decoration: TextDecoration.underline),
                          )),
                      const SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kBottomColor,
                                fixedSize: Size(325.w, 50.h)),
                            onPressed: () {},
                            child: Text(
                              'ورود',
                              style: kmediumTextStyle.copyWith(color: kBgColor),
                            )),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kFirstColor,
                                fixedSize: Size(325.w, 50.h)),
                            onPressed: () {},
                            child: Text(
                              'ثبت نام',
                              style: kmediumTextStyle.copyWith(color: kBgColor),
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
    );
  }
}
