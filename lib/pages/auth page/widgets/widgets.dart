import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/const.dart';

AppBar buildAppbar() {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          color: kSecondColor.withOpacity(0.5),
          height: 1,
        )),
    centerTitle: true,
    title: Text(
      'ورود',
      style: kmediumTextStyle,
    ),
  );
}

Widget thirdPartyLogin(BuildContext context) {
  // pass context for accessing BloC
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 40.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _loginIcons(
          iconName: 'google',
        ),
        _loginIcons(
          iconName: 'apple',
        ),
        _loginIcons(
          iconName: 'facebook',
        ),
      ],
    ),
  );
}

Widget _loginIcons({required String iconName}) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("icons/$iconName.png"),
    ),
  );
}
