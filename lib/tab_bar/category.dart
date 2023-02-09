import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/Drawer/home_drawer.dart';
import 'package:gymsupplimentshop/pages/cart_page.dart';
import 'package:gymsupplimentshop/screen/cat_screen.dart';
import 'package:sidebarx/sidebarx.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final _controller = SidebarXController(selectedIndex: 0);
  //final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Fitness Center',
          style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Carts()));
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.red[700],
              ),
            ),
          ),
        ],
        iconTheme: IconThemeData(
            color: Colors.red[700]
        ),
      ),
      drawer: HomDrawer(),
      body: Stack(
      children: [
        Row(
          children: [
            SidebarX(
              controller: _controller,
                theme: SidebarXTheme(
                  textStyle: TextStyle(color: Colors.black),
                  itemTextPadding: const EdgeInsets.only(left: 2),
                  selectedItemTextPadding: const EdgeInsets.only(left: 2),
                  width: 130,
                  selectedItemDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              items: [
                SidebarXItem(icon: Icons.fitness_center,label: 'Protien',),
                SidebarXItem(icon: Icons.seven_k,label: 'Pre Workout'),
                SidebarXItem(icon: Icons.star,label: 'Fat Loss'),
                SidebarXItem(icon: Icons.local_drink,label: 'Workout'),
                SidebarXItem(icon: Icons.account_tree_outlined,label: 'Mass Gainer'),
                SidebarXItem(icon: Icons.fast_forward,label: 'Speciality'),
                SidebarXItem(icon: Icons.ac_unit_sharp,label: 'Essential'),
              ],
            ),
            Expanded(
              child: Center(
                child: CatScreens(controllers: _controller),
              ),
            ),
          ],
        ),
      ],
      ),
    );
  }
}