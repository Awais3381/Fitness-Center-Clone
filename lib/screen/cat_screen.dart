import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/helper_widget/cart_custom_card.dart';
import 'package:gymsupplimentshop/helper_widget/custom_card.dart';
import 'package:gymsupplimentshop/model/cart_model.dart';
import 'package:gymsupplimentshop/model/product_model.dart';
import 'package:gymsupplimentshop/pages/product_detail.dart';
import 'package:sidebarx/sidebarx.dart';

class CatScreens extends StatelessWidget {
  const CatScreens({Key? key,required this.controllers,}) : super(key: key);
  final SidebarXController controllers;
  @override
  Widget build(BuildContext context) {

    List<CartModel> cartdetail=[];
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
    return AnimatedBuilder(
        animation: controllers,
        builder: (context,child) {
          switch (controllers.selectedIndex){
            case 0:
              return Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisExtent: 200,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 20,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return CustomCard(
                        prImage: prDetail[index].images,
                        prName: prDetail[index].name,
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
                    );
                  },
                ),
              );
            case 1:
              return Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 10,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return CustomCard(
                        prImage: prDetail[index].images,
                        prName: prDetail[index].name,
                        price: prDetail[index].price,
                        onTaps: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              ProductDetail(
                                pr_picture: prDetail[index].images,
                                pr_name: prDetail[index].name,
                                price: prDetail[index].price,
                              )));
                          print('Custom Card Clicked');
                        }
                    );
                  },
                ),
              );
            case 2:
              return Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: Column(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 5,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return CustomCard(
                            prImage: prDetail[index].images,
                            prName: prDetail[index].name,
                            price: prDetail[index].price,
                            onTaps: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  ProductDetail(
                                    pr_picture: prDetail[index].images,
                                    pr_name: prDetail[index].name,
                                    price: prDetail[index].price,
                                  )));
                              print('Custom Card Clicked');
                            }
                        );
                      },
                    ),
                  ],
                ),
              );
            case 3:
              return Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 8,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return CustomCard(
                        prImage: prDetail[index].images,
                        prName: prDetail[index].name,
                        price: prDetail[index].price,
                        onTaps: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              ProductDetail(
                                pr_picture: prDetail[index].images,
                                pr_name: prDetail[index].name,
                                price: prDetail[index].price,
                              )));
                          print('Custom Card Clicked');
                        }
                    );
                  },
                ),
              );
            case 4:
              return Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: Column(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 2,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return CustomCard(
                            prImage: prDetail[index].images,
                            prName: prDetail[index].name,
                            price: prDetail[index].price,
                            onTaps: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  ProductDetail(
                                    pr_picture: prDetail[index].images,
                                    pr_name: prDetail[index].name,
                                    price: prDetail[index].price,
                                  )));
                              print('Custom Card Clicked');
                            }
                        );
                      },
                    ),
                  ],
                ),
              );
            case 5:
              return Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: Column(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 3,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return CustomCard(
                            prImage: prDetail[index].images,
                            prName: prDetail[index].name,
                            price: prDetail[index].price,
                            onTaps: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  ProductDetail(
                                    pr_picture: prDetail[index].images,
                                    pr_name: prDetail[index].name,
                                    price: prDetail[index].price,
                                  )));
                              print('Custom Card Clicked');
                            }
                        );
                      },
                    ),
                  ],
                ),
              );
            case 6:
              return Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: Column(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 1,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return CustomCard(
                            prImage: prDetail[index].images,
                            prName: prDetail[index].name,
                            price: prDetail[index].price,
                            onTaps: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  ProductDetail(
                                    pr_picture: prDetail[index].images,
                                    pr_name: prDetail[index].name,
                                    price: prDetail[index].price,
                                  )));
                              print('Custom Card Clicked');
                            }
                        );
                      },
                    ),
                  ],
                ),
              );

            default:
              return Text(
                'Not found page',
              );
          };
        },
        );
  }
}

