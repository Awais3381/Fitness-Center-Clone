import 'package:flutter/material.dart';
import 'package:gymsupplimentshop/helper_widget/custom_card.dart';
import 'package:gymsupplimentshop/model/cart_model.dart';
import 'package:gymsupplimentshop/model/product_model.dart';
import 'package:gymsupplimentshop/pages/product_detail.dart';

class BestSellingPr extends StatefulWidget {
  const BestSellingPr({Key? key}) : super(key: key);

  @override
  State<BestSellingPr> createState() => _BestSellingPrState();
}

class _BestSellingPrState extends State<BestSellingPr> {

 List<String> Name=['Creatine','Why Protien','Omega 3','BCAA/Leucine','Glucosamine','Multivitamins','Beta-Alanine','Creatine Monohydrate','PHD Gainer','C4','BCCA Amino Hydrate','Electrolytes','Glucosamine','Creatine','Omega 3','BCAA/Leucine','Glucosamine','Multivitamins','Beta-Alanine','Electrolytes','Glucosamine','Beta-Alanine','Electrolytes','Glucosamine','Beta-Alanine'];

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.red[700]
        ),
        title: Text(
          'Fitness Center',
          style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.w500),
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
                    // prDetail.add(name.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList());
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

      backgroundColor: Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: searchController.text.isNotEmpty && NameSearch.isEmpty ? Center(
                    child: Column(
                      children:[
                        Padding(
                          padding: const EdgeInsets.only(top: 180),
                          child: Icon(Icons.search_off,color: Colors.red,size: 60,),
                        ),
                        Text('Sorry! No Result Found',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),)
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
                      itemCount: searchController.text.isNotEmpty ? NameSearch.length : prDetail.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 10),
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
                                      )));
                                }
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}