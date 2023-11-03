import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/common/constant/const.dart';
import 'package:shopping_app/pages/main_pages/home_screen/bloc/home_bloc.dart';

AppBar buildAppbar() {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: kBgColor,
    title: Container(
      margin: EdgeInsets.only(top: 10.h, right: 5.w, left: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const NeumorphicAnimatedIcon(),
          // IconButton(
          //     onPressed: () {},
          //     icon: Image.asset(
          //       'icons/menu.png',
          //       color: kFirstColor,
          //       scale: 1.3,
          //     )),
          GestureDetector(
            child: const CircleAvatar(
              backgroundColor: kFirstColor,
              child: Icon(
                Icons.person,
                color: kThirdColor,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

///
class SearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const SearchInput(
      {required this.textController, required this.hintText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          icon: IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: kFirstColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))),
              onPressed: () {},
              icon: Image.asset(
                'icons/options.png',
                scale: 2.7,
                color: kThirdColor,
              )),
          prefixIcon: const Icon(
            Icons.search,
            color: kBottomColor,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintTextDirection: TextDirection.rtl,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kFirstColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kSecondColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
          ),
        ),
      ),
    );
  }
}

///
class SliderView extends StatefulWidget {
  final BuildContext context;
  final HomeState state;
  SliderView({
    required this.context,
    required this.state,
  });

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  final PageController _pageController = PageController(initialPage: 0);

  void startAutoSliding() {
    var index = 0;
    Timer.periodic(const Duration(seconds: 5), (Timer t) {
      if (index < 3) {
        index++;
      } else {
        index = 0;
      }
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      if (index > 3) {
        widget.context.read<HomeBloc>().add(HomeDotsEvent(0));
      } else {
        widget.context.read<HomeBloc>().add(HomeDotsEvent(index));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startAutoSliding();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160.h,
          width: 325.w,
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              context.read<HomeBloc>().add(HomeDotsEvent(value));

              // print("value:${value}");
            },
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Image.asset(
                  'icons/Art.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Image.asset(
                  'icons/Image(1).png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Image.asset(
                  'icons/Image(2).png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Image.asset(
                  'icons/image(3).png',
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

///
class NeumorphicAnimatedIcon extends StatefulWidget {
  const NeumorphicAnimatedIcon({super.key});

  @override
  State<NeumorphicAnimatedIcon> createState() => _NeumorphicAnimatedIconState();
}

class _NeumorphicAnimatedIconState extends State<NeumorphicAnimatedIcon>
    with TickerProviderStateMixin {
  double turns = 0.0;
  bool isClicked = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      curve: Curves.easeOutExpo,
      duration: const Duration(seconds: 1),
      child: GestureDetector(
        onTap: () {
          if (isClicked) {
            setState(() => turns -= 1 / 4);
            _controller.reverse();
          } else {
            setState(() => turns += 1 / 4);
            _controller.forward();
          }
          isClicked = !isClicked;
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInExpo,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: kFirstColor,
            // boxShadow: [
            //   BoxShadow(
            //       blurRadius: 30,
            //       offset: isClicked
            //           ? const Offset(20, -20)
            //           : const Offset(20, 20),
            //       color: Colors.grey.shade700),
            //   BoxShadow(
            //       blurRadius: 30,
            //       offset: isClicked
            //           ? const Offset(-20, 20)
            //           : const Offset(-20, -20),
            //       color: Colors.black)
            // ]
          ),
          child: SizedBox(
            height: 30.h,
            width: 32.w,
            child: Center(
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _controller,
                size: 22.w,
                color: kThirdColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///
Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: RcrossAxisAlignment,
          children: [
            Text("همه",
                style: kmediumTextStyle.copyWith(
                    color: kSecondColor.withOpacity(0.5))),
            Text("دسته بندی محصولات",
                style: kmediumTextStyle.copyWith(fontSize: 23)),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const HorizontalCategoriesView()
    ],
  );
}

// Container(
//   margin: EdgeInsets.only(top: 10.h),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       tabButton('جدید ترین ها'),
//       tabButton('محبوب ترین ها'),
//       tabButton('همه'),
//     ],
//   ),
// )
// Widget tabButton(String title) {
//   return Container(
//     padding: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 5.h),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: kBottomColor,
//         border: Border.all(color: kFirstColor)),
//     child: Text(
//       title,
//       style: kmediumTextStyle.copyWith(color: kBgColor),
//     ),
//   );
// }
class HorizontalCategoriesView extends StatefulWidget {
  const HorizontalCategoriesView({Key? key}) : super(key: key);

  @override
  State<HorizontalCategoriesView> createState() =>
      _HorizontalCategoriesViewState();
}

class _HorizontalCategoriesViewState extends State<HorizontalCategoriesView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 325.w,
      child: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categoryList[index],
              onPressed: (b) {
                categoryList.forEach((category) {
                  category.isSelected = false;
                });
                setState(() {
                  categoryList[index].isSelected = true;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class Category {
  final String title;
  bool isSelected;
  Category(this.title, this.isSelected);
}

List<Category> categoryList = [
  Category("همه", true),
  Category("محبوب ترین ها", false),
  Category("جدید ترین ها", false),
];

class CategoryCard extends StatefulWidget {
  final Category category;
  final Function(bool) onPressed;

  const CategoryCard(
      {required this.category, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color:
              widget.category.isSelected ? kBottomColor : Colors.transparent),
      child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            widget.onPressed(true);
          },
          child: Text(widget.category.title,
              style: kmediumTextStyle.copyWith(
                  fontSize: 13,
                  color: widget.category.isSelected
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : kSecondColor))),
    );
  }
}

Widget itemsGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        image: const DecorationImage(
            fit: BoxFit.fill, image: AssetImage('icons/Image(2).png')),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: RmainAxisAlignment,
      crossAxisAlignment: RcrossAxisAlignment,
      children: [
        Text(
          'البسه مخصوص نوزادان',
          maxLines: 1,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: kmediumTextStyle.copyWith(fontSize: 12.sp, color: kBgColor),
        ),
        Text(
          'از بهترین برند ها در سایز های مختلف ',
          maxLines: 1,
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: kmediumTextStyle.copyWith(fontSize: 9.sp, color: kFirstColor),
        )
      ],
    ),
  );
}
