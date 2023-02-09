import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/pages/about_screen.dart';
import 'package:gymsupplimentshop/pages/contact_us.dart';
import 'package:gymsupplimentshop/pages/signin_screen.dart';

class HomDrawer extends StatefulWidget {
  const HomDrawer({Key? key}) : super(key: key);

  @override
  State<HomDrawer> createState() => _HomDrawerState();
}

class _HomDrawerState extends State<HomDrawer> {
  @override
  Widget build(BuildContext context) {
    Widget YesButton=TextButton(onPressed: (){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignIn()), (Route<dynamic> route) => false);
    }, child: Text('Yes',style: TextStyle(color: Colors.black),));
    Widget NoButton=TextButton(onPressed: (){
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pop();
    }, child: Text('No',style: TextStyle(color: Colors.black),));
    AlertDialog alertDialog = AlertDialog(
      title: Text('Fitness Center',style: TextStyle(color: Colors.red[700]),),
      content: Text('Are you sure want to logout?'),
      actions: [
        YesButton,
        NoButton
      ],
    );
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/logo.png',))),
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('About us'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => About()));
              },
            ),
              ListTile(
                leading: Icon(Icons.alternate_email),
                title: Text('Contact Us'),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Contact_us()));
                },
              ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                  return alertDialog;
                  },);
              },
            )
          ],
        ),
      ),
    );
  }
}