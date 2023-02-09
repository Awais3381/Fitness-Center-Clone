import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/model/cart_model.dart';
import 'package:gymsupplimentshop/pages/cart_page.dart';

class ProductDetail extends StatefulWidget {
  final pr_picture;
  final pr_name;
  final price;
  final cartdetail;


  ProductDetail({this.pr_picture,this.pr_name,this.price,this.cartdetail});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final TextEditingController searchController=TextEditingController();
  String dropdownvalue= '1 kg';
  String dropdownvalue2= 'Chocolate';
  var items=['1 kg','2 kg','3 kg','4 kg','5 kg'];
  var items2=['Chocolate','Banana','Vanilla','Strawberry','Mango'];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white24.withOpacity(0.9),
      appBar: AppBar(
        title: Text('Fitness Center',
        style: TextStyle(color: Colors.red[700],fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.red[700]
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.red[700],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.pr_picture!),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 240),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        child: Text(widget.pr_name!,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 20),
                  child: Row(
                    children: [
                      Container(
                        child: Text(widget.price!,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Weight  '),
                      Text('   Flavour')
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: dropdownvalue2,
                      icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                      items: items2.map((String items2){
                        return DropdownMenuItem(
                            value: items2,
                            child: Text(items2,style: TextStyle(color: Colors.red),));
                      }).toList(),
                      onChanged: (String? newValue){
                        dropdownvalue2 = newValue!;
                      },
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                      items: items.map((String items){
                        return DropdownMenuItem(
                            value: items,
                            child: Text(items,style: TextStyle(color: Colors.red),));
                      }).toList(),
                      onChanged: (String? newValue){
                        dropdownvalue = newValue!;
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.black)
                        ),
                        child: TextButton(
                          onPressed: (){
                             widget.cartdetail.add(CartModel(image: widget.pr_picture,name: widget.pr_name,price: widget.price));
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Carts(cartDetail: widget.cartdetail)));
                            },
                          child: Center(child: Text('Add to Cart',style: TextStyle(color: Colors.black,fontSize:15,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          border: Border.all(color: Colors.red)
                        ),
                        child: Center(child: Text('Shop Now',style: TextStyle(color: Colors.red,fontSize:15,fontWeight: FontWeight.bold),)),
                      ),
                    ],
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
