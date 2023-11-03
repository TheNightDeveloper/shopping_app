import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constant/const.dart';
import 'bloc/welcome_bloc.dart';
import 'bloc/welcome_event.dart';
import 'bloc/welcome_state.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBgColor,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 35.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvents());
                    state.page = index;
                  },
                  scrollDirection: Axis.horizontal,
                  children: [
                    _page(
                      index: 1,
                      bottomNama: 'بعدی',
                      title: 'خریدی آسان و مطمئن',
                      subTitle: 'هرچه نیاز دارید همینجاست',
                      imageName: '1.png',
                      context: context,
                      pageController: pageController,
                    ),
                    _page(
                        index: 2,
                        bottomNama: 'بعدی',
                        title: 'متنوع ترین اجناس و مدل ها',
                        subTitle: 'از بهترین برند های بازار',
                        imageName: '2.jpg',
                        context: context,
                        pageController: pageController),
                    _page(
                        index: 3,
                        bottomNama: 'ورود',
                        title: 'صرفه جویی در زمان',
                        subTitle:
                            'دیگه نیازی نیست ساعت ها وقتو برای خرید هدر بدی',
                        imageName: '3.png',
                        context: context,
                        pageController: pageController),
                  ],
                ),
                Positioned(
                    bottom: 40.h,
                    child: DotsIndicator(
                      position: state.page,
                      mainAxisAlignment: MainAxisAlignment.center,
                      dotsCount: 3,
                      decorator: const DotsDecorator(
                        color: kFirstColor,
                        size: Size.square(8),
                        activeColor: kSecondColor,
                        activeSize: Size.square(11),
                      ),
                    ))
              ],
            ),
          );
        },
      )),
    );
  }
}

class _page extends StatelessWidget {
  final PageController? pageController;
  final int? index;
  final String? bottomNama, title, subTitle, imageName;
  final BuildContext? context;
  _page(
      {this.index,
      this.bottomNama,
      this.imageName,
      this.title,
      this.subTitle,
      this.context,
      this.pageController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350.w,
          height: 375.w,
          child: Image.asset(
            'img/$imageName',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title!,
            style: kLargeTextStyle,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: Text(
            subTitle!,
            style: kmediumTextStyle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: kBottomColor,
              borderRadius: BorderRadius.circular(20.w),
              boxShadow: const [
                BoxShadow(
                    color: kSecondColor,
                    spreadRadius: 3,
                    blurRadius: 15,
                    offset: Offset(0, 5))
              ]),
          child: InkWell(
            onTap: () {
              if (index! < 3) {
                // animate to next page
                pageController!.animateToPage(index!,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastEaseInToSlowEaseOut);
              } else {

                storageService.setBool(storageDeviceOpenFirstTime, false);
                Navigator.pushNamedAndRemoveUntil(
                    context, 'LoginPage', (route) => false);
              }
            },
            child: Center(
              child: Text(
                bottomNama!,
                style: kmediumTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
