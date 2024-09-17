import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:taxicash/bloc/navbar/bloc.dart';
import 'package:taxicash/bloc/navbar/event.dart';
import 'package:taxicash/bloc/navbar/state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // nav page controller
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // device screen size
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocListener<BottomNavBarBloc, BottomNavBarState>(
        listener: (context, state) {
          _pageController.jumpToPage(state.index);
        },
        child: PageView(
          controller: _pageController,
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Text("Screen 1"),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: Text("Screen 2"),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: Text("Screen 3"),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: Text("Screen 4"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
      return SalomonBottomBar(
        currentIndex: state.index,
        onTap: (index) {
          BlocProvider.of<BottomNavBarBloc>(context).add(NavigateEvent(index));
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      );
    });
  }
}
