import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/common/constant/const.dart';
import 'package:shopping_app/pages/main_pages/home_screen/bloc/home_bloc.dart';
import 'package:shopping_app/pages/main_pages/home_screen/widgets/home_screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kBgColor,
          appBar: buildAppbar(),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
            child: CustomScrollView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: Text(
                      'کاربر',
                      style: kmediumTextStyle.copyWith(
                          fontSize: 50, color: kThirdColor),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(
                  child: SearchInput(
                      textController: _textEditingController,
                      hintText: 'جستجو'),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(
                  child: SliderView(
                    state: state,
                    context: context,
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(
                  child: DotsIndicator(
                    decorator: const DotsDecorator(
                      color: kFirstColor,
                      size: Size.square(8),
                      activeColor: kSecondColor,
                      activeSize: Size.square(11),
                    ),
                    dotsCount: 4,
                    position: (state.index),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                SliverToBoxAdapter(child: menuView()),
                SliverPadding(
                  padding: EdgeInsets.only(top: 10.h),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        childCount: 6,
                        (context, index) => GestureDetector(
                              onTap: () {},
                              child: itemsGrid()
                            )),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.6),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
