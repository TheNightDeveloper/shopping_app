import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/common/constant/const.dart';
import 'package:shopping_app/pages/main_pages/main_screen/bloc/main_bloc.dart';
import 'package:shopping_app/pages/main_pages/main_screen/widgets/main_screens_widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        builder: (context, state) => Container(
              color: kBgColor,
              child: SafeArea(
                  child: Scaffold(
                body: buildScreen(context.read<MainBloc>().state.index),
                bottomNavigationBar: BottomNavigationBar(
                    onTap: (value) {
                      context.read<MainBloc>().add(Trigger(value));
                    },
                    currentIndex: context.read<MainBloc>().state.index,
                    elevation: 10,
                    selectedItemColor: kThirdColor,
                    unselectedItemColor: kSecondColor.withOpacity(0.5),
                    backgroundColor: kFirstColor,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: bottomTabs),
              )),
            ));
  }
}
