import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/model/cart_model.dart';

class CustomCard extends StatefulWidget {
  final String? prImage;
  final String? prName;
  final String? price;
  final Function()? onTaps;

  CustomCard({this.prImage='',this.prName='',this.price='',this.onTaps});
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: InkWell(
          onTap: widget.onTaps,
          child: Column(
            children: [
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(widget.prImage!),
              ),
              Divider(
                color: Colors.red,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.prName!,style: TextStyle(fontSize: 10),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.price!,style: TextStyle(fontSize: 10),),
                  ],
                ),
              ),
              Container(
                height: 23,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black
                ),
                child: Center(child: Text('Shop Now',style: TextStyle(color: Colors.red,fontSize:9),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
