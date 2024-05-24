import 'package:advance/src/presentation/manager/home_nav/home_nav_cubit.dart';
import 'package:advance/src/presentation/screens/discussion_screen.dart';
import 'package:advance/src/presentation/screens/home_screen.dart';
import 'package:advance/src/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavScreen extends StatelessWidget {
  const HomeNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> homeBodyWidgets = [
      const HomeScreen(),
      const DiscussionScreen(),
      const ProfileScreen(),
    ];

    return BlocBuilder<HomeNavCubit, HomeNav>(
      builder: (context, selectedNav) {
        return Scaffold(
          body: homeBodyWidgets[selectedNav.index],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (int index) {
                context.read<HomeNavCubit>().navTo(HomeNav.values[index]);
              },
              currentIndex: selectedNav.index,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Discussion',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ]),
        );
      },
    );
  }
}
