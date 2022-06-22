import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class mBottomBar extends StatefulWidget {
  static const String routeName = '/main-home';
  const mBottomBar({Key? key}) : super(key: key);

  @override
  State<mBottomBar> createState() => _mBottomBarState();
}

class _mBottomBarState extends State<mBottomBar> {
  int _pageIndex = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;


  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text('Shopping Cart'),),
    const AccountScreen(),
  ];

  void updatePage(int page){
    setState((){
      _pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        selectedItemColor: mVariables.selectedNavBarColor,
        unselectedItemColor: mVariables.unselectedNavBarColor,
        backgroundColor: mVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //Home
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _pageIndex == 0
                        ? mVariables.selectedNavBarColor
                        : mVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          //Cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _pageIndex == 1
                        ? mVariables.selectedNavBarColor
                        : mVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: Badge(
                elevation: 0,
                badgeContent: const Text('2'),
                badgeColor: Colors.white,
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
            label: '',
          ),
          //Person
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _pageIndex == 2
                        ? mVariables.selectedNavBarColor
                        : mVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
