import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Fitness Center',style: TextStyle(color: Colors.red[700]),),
        iconTheme: IconThemeData(
          color: Colors.red[700]
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Center(
                  child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: 'About ',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600)),
                          TextSpan(text: 'Fit',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600)),
                          TextSpan(text: 'ness ',style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.w600)),
                          TextSpan(text: 'Center',style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.w600)),
                       ]
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: ListView(
              children: [
                ListTile(
                  title: Text('# We ship to Pakistan every day'),
                ),
                ListTile(
                  title: Text('# Best deals & prices on 7,500+ products'),
                ),
                ListTile(
                  title: Text('# Buy using Pakistani Rupees (PKR)'),
                ),
                ListTile(
                  title: Text('# Transaction processed in Pakistan = no transaction fees'),
                ),ListTile(
                  title: Text('# Pay with Visa, MasterCard, Discover, Diners & JCB'),
                ),ListTile(
                  title: Text('# Earn rewards for shopping, reviewing and referring'),
                ),ListTile(
                  title: Text('# 100% Satisfaction Guarantee'),
                ),


              ],
            ),
          )
        ],
      )
    );
  }
}
