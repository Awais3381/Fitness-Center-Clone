import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/Drawer/home_drawer.dart';
import 'package:gymsupplimentshop/pages/cart_page.dart';
class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Carts()));
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
          SizedBox(
            height: 240,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('images/splash.jpeg',fit: BoxFit.cover,),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  child: Image.asset('images/logo.png'),
                  height: 180,
                ),
                const Text('Pakistan No 1 Supplement Shop',style: TextStyle(color: Colors.black,fontSize: 20),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shadowColor: Colors.black87,
                  color: Colors.black,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        const Text('  Username:  ',style: TextStyle(color: Colors.white,fontSize: 20),),
                        // Text("${loggedInUser.username}",
                        //   style: const TextStyle(
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 20
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 10,
                  color: Colors.black,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        const Text('  Email:  ',style: TextStyle(color: Colors.white,fontSize: 20),),
                        // Text("${loggedInUser.email}",
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 20,
                        //     //fontWeight: FontWeight.bold
                        //   ),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.black,
                  elevation: 10,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),

                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        const Text('   Address:  ',style: TextStyle(color: Colors.white,fontSize: 20),),
                        // Text("${loggedInUser.address}",
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 20,
                        //     //fontWeight: FontWeight.bold
                        //   ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}


