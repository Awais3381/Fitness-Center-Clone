import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// Padding(
//   padding: EdgeInsets.only(top:2,left: 40),
//   child: Column(
//     children: [
//       Transform.scale(
//         scale: 2,
//         child: ToggleSwitch(
//           minHeight: 30,
//           minWidth: 50,
//           initialLabelIndex: 1,
//           totalSwitches: 2,
//           labels: ['Off','On'],
//           activeBgColors: [[Colors.black45, Colors.black26],[Colors.red, Colors.black] ],
//           onToggle: (index){
//             print('switched to:$index');
//           },
//         ),
//       ),
//     ],
//   ),
// ),
class CarSlider extends StatefulWidget {
  const CarSlider({Key? key}) : super(key: key);

  @override
  State<CarSlider> createState() => _CarSliderState();
}

class _CarSliderState extends State<CarSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('images/img1.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('images/img2.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('images/img3.jpg'),
                    fit: BoxFit.cover
                )
            ),
          )
        ],
        options: CarouselOptions(
            height: 200,
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            reverse: false,
            enlargeCenterPage: true
        ));
  }
}
