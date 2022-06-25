import 'package:amazon_clone/common/widgets/custom_bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case mBottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const mBottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductScreen(),
      );
    case CategoryDealScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CategoryDealScreen(category: category),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Screen doesn not exist!'),
          ),
        ),
      );
  }
}
