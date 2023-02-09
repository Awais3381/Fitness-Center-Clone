import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/Drawer/home_drawer.dart';

class Carts extends StatefulWidget {
  final cartDetail;

  Carts({this.cartDetail});

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Fitness Center',
          style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.w500),
        ),
        iconTheme: IconThemeData(
            color: Colors.red[700]
        ),
      ),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text("Total"),
                //subtitle: Text(allPrice().toString()),
              ),
            ),
            Expanded(
                child: MaterialButton(
              onPressed: () {},
              child: Text(
                'Check Out',
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.red,
            ))
          ],
        ),
      ),

      drawer: HomDrawer(),
      // body: ListView.builder(
      //   //itemCount: widget.cartDetail.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       child: Card(
      //         elevation: 10,
      //         margin: EdgeInsets.all(8),
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(10)
      //         ),
      //         child: ListTile(
      //          leading: Image.asset(widget.cartDetail[index].image),
      //           title: Text(widget.cartDetail[index].name),
      //           subtitle: Text(widget.cartDetail[index].price),
      //           trailing: Icon(Icons.clear, color: Colors.black,),
      //
      //         ),
      //       ),
      //     );
      //   },
      // )
    );
  }

  getItem() {
    String num = "";
    for (int i = 0; i < widget.cartDetail.length; i++) {
      num += widget.cartDetail[i].price;
      print(num);
    }
    return num;
  }

  allPrice() {
    String? num = "";
    for (int i = 0; i < widget.cartDetail.length; i++) {
      num + widget.cartDetail[i].price;
    }
    return num;
  }
}
