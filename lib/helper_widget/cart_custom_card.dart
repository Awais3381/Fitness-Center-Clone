import 'package:flutter/material.dart';

class CatCard extends StatefulWidget {
  final String? prImage;
  final String? prName;
  final String? price;

  CatCard({this.prImage='',this.prName='',this.price=''});

  @override
  State<CatCard> createState() => _CatCardState();
}

class _CatCardState extends State<CatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
        ),
          child: Row(
            children: [
              Container(
                height: 120,
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
                padding: const EdgeInsets.only(top: 2,left: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.price!,style: TextStyle(fontSize: 10),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black
                  ),
                  child: Center(child: Text('Shop Now',style: TextStyle(color: Colors.red,fontSize:8),)),
                ),
              )
            ],
          ),
        ),
      );
  }
}
