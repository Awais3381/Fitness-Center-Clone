import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/Drawer/home_drawer.dart';
import 'package:gymsupplimentshop/model/cart_model.dart';
import 'package:gymsupplimentshop/pages/cart_page.dart';
import 'package:gymsupplimentshop/pages/signin_screen.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gymsupplimentshop/pages/signup_screen.dart';
import 'package:gymsupplimentshop/slider/carousel_slider.dart';
import 'package:gymsupplimentshop/tab_bar/category.dart';
import 'package:gymsupplimentshop/tab_bar/home.dart';
import 'package:gymsupplimentshop/tab_bar/user_profile.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  int index=0;
  List<CartModel> cartdetail=[];
  final Screens=[
    Home(),
    Category(),
    Carts(),
    UserProfile(),
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: NavigationBar(
              height: 60,
              selectedIndex: index,
              onDestinationSelected: (index){
                setState(() {
                  this.index=index;
                });
              },
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.category), label: 'Category'),
                NavigationDestination(icon: Icon(Icons.add_shopping_cart_outlined), label: 'Cart'),
                NavigationDestination(icon: Icon(Icons.account_circle), label: 'Profile'),
                ],
      ),
      body: Screens[index]
    );
  }
}
