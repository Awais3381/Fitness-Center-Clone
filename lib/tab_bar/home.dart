import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/Drawer/home_drawer.dart';
import 'package:gymsupplimentshop/helper_widget/custom_card.dart';
import 'package:gymsupplimentshop/model/cart_model.dart';
import 'package:gymsupplimentshop/model/product_model.dart';
import 'package:gymsupplimentshop/pages/best_selling_pr.dart';
import 'package:gymsupplimentshop/pages/cart_page.dart';
import 'package:gymsupplimentshop/pages/product_detail.dart';
import 'package:gymsupplimentshop/slider/carousel_slider.dart';

class Home extends StatefulWidget {
  final pr_picture;
  final pr_name;
  final price;

  Home({this.pr_picture,this.pr_name,this.price});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> Name=['Creatine','Omega 3','BCAA/Leucine','Glucosamine','Multivitamins','Beta-Alanine','Electrolytes','Glucosamine','Creatine','Omega 3','BCAA/Leucine','Glucosamine','Multivitamins','Beta-Alanine','Electrolytes','Glucosamine','Beta-Alanine','Electrolytes','Glucosamine','Beta-Alanine'];
  bool isSwitched = true;
  List<CartModel> cartdetail=[];

  final TextEditingController searchController = TextEditingController();
  List<String> NameSearch=[];
  List<ProductModel> prDetail=[
    ProductModel(
        id: 1,
        name: 'Creatine',
        price: 'Rs 999',
        images: 'images/i1.png'
    ),
    ProductModel(
        id: 2,
        name: 'Whey Protein',
        price: 'Rs 1999',
        images: 'images/i2.png'
    ),
    ProductModel(
        id: 3,
        name: 'Omega 3',
        price: 'Rs 2999',
        images: 'images/i4.png'
    ),
    ProductModel(
        id: 4,
        name: 'BCAA/Leucine',
        price: 'Rs 9999',
        images: 'images/i5.png'
    ),
    ProductModel(
        id: 5,
        name: 'Glucosamine',
        price: 'Rs 1500',
        images: 'images/i6.png'
    ),ProductModel(
        id: 6,
        name: 'Multivitamins',
        price: 'Rs 6999',
        images: 'images/i7.png'
    ),ProductModel(
        id: 7,
        name: 'Creatine Monohydrate',
        price: 'Rs 2000',
        images: 'images/i8.png'
    ),
    ProductModel(
        id: 8,
        name: 'PHD Gainer',
        price: 'Rs 1290',
        images: 'images/i3.png'
    ),
    ProductModel(
        id: 9,
        name: 'C4',
        price: 'Rs 1199',
        images: 'images/i9.png'
    ),ProductModel(
        id: 10,
        name: 'BCCA Amino Hydrate',
        price: 'Rs 5999',
        images: 'images/i10.png'
    ),
    ProductModel(
        id: 11,
        name: 'Creatine',
        price: 'Rs 999',
        images: 'images/i1.png'
    ),
    ProductModel(
        id: 12,
        name: 'Whey Protein',
        price: 'Rs 1999',
        images: 'images/i2.png'
    ),
    ProductModel(
        id: 13,
        name: 'Omega 3',
        price: 'Rs 2999',
        images: 'images/i4.png'
    ),
    ProductModel(
        id: 14,
        name: 'BCAA/Leucine',
        price: 'Rs 9999',
        images: 'images/i5.png'
    ),
    ProductModel(
        id: 15,
        name: 'Glucosamine',
        price: 'Rs 1500',
        images: 'images/i6.png'
    ),ProductModel(
        id: 16,
        name: 'Multivitamins',
        price: 'Rs 6999',
        images: 'images/i7.png'
    ),ProductModel(
        id: 17,
        name: 'Creatine Monohydrate',
        price: 'Rs 2000',
        images: 'images/i8.png'
    ),
    ProductModel(
        id: 18,
        name: 'PHD Gainer',
        price: 'Rs 1290',
        images: 'images/i3.png'
    ),
    ProductModel(
        id: 19,
        name: 'C4',
        price: 'Rs 1199',
        images: 'images/i9.png'
    ),ProductModel(
        id: 20,
        name: 'BCCA Amino Hydrate',
        price: 'Rs 5999',
        images: 'images/i10.png'
    ),

  ];



  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  var sName=<String>[];
  @override
  void initState() {
    sName.addAll(Name);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(Name);
    if(query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        sName.clear();
        sName.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        sName.clear();
        sName.addAll(Name);
      });
    }
  }

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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: Container(
            height: 50,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    NameSearch=
                        Name.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
                  });
                },
                controller: searchController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: 'Search',
                    fillColor: Colors.white,
                    filled: true,
                    // hintStyle: TextStyle(color: Colors.red),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
              ),
            ),
          ),
        ),
      ),
      drawer: HomDrawer(),
      body: SingleChildScrollView(
        child: Stack(
            children: [
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Padding(
            padding: const EdgeInsets.only(right: 5),
                child: Transform.scale(
                scale: 1.2,
                child: Switch(
                onChanged: toggleSwitch,
                value: isSwitched,
                activeColor: Colors.black,
                activeTrackColor: Colors.red,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.white,
                )),
                ),
                isSwitched ? Container(child: CarSlider(),) : Container(),
              Padding(
                padding: const EdgeInsets.only(top:14,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Trending Products',style: TextStyle(fontWeight: FontWeight.bold),),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BestSellingPr()));
                      },
                      child: Row(
                        children:  <Widget>[
                          Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.red, fontSize: 13),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 220.0,
                        child: searchController.text.isNotEmpty && NameSearch.isEmpty ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Icon(Icons.search_off,color: Colors.red,size: 20,),
                              Text('Sorry! No Result Found',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                            ],
                          ),
                        )
                            : GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisExtent: 220
                          ),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          primary: false,
                          itemCount: searchController.text.isNotEmpty ? NameSearch.length : Name.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                child: CustomCard(
                                    prImage: prDetail[index].images,
                                    prName: searchController.text.isNotEmpty ? NameSearch[index] : prDetail[index].name,
                                    price: prDetail[index].price,
                                    onTaps: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                          ProductDetail(
                                            pr_picture: prDetail[index].images,
                                            pr_name: prDetail[index].name,
                                            price: prDetail[index].price,
                                            cartdetail: cartdetail,
                                          ),

                                      )
                                      );

                                    }
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ]),

              Padding(
                padding: const EdgeInsets.only(top:5,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Best Selling Products',style: TextStyle(fontWeight: FontWeight.bold),),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BestSellingPr()));
                      },
                      child: Row(
                        children:  <Widget>[
                          Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.red, fontSize: 13),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: searchController.text.isNotEmpty && NameSearch.isEmpty ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                       Icon(Icons.search_off,color: Colors.red,size: 20,),
                      Text('Sorry! No Result Found',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                    ],
                  ),
                ) : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 220
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: searchController.text.isNotEmpty ? NameSearch.length : Name.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        child: CustomCard(
                            prImage: prDetail[index].images,
                            prName: searchController.text.isNotEmpty ? NameSearch[index] : prDetail[index].name,
                            price: prDetail[index].price,
                            onTaps: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  ProductDetail(
                                    pr_picture: prDetail[index].images,
                                    pr_name: prDetail[index].name,
                                    price: prDetail[index].price,
                                    cartdetail: cartdetail,
                                  ),
                              )
                              );
                            }
                        ),
                      ),
                    );
                  },
                ),
              ),
                ]),
                ],
        ),
      ),
    );
  }
}
