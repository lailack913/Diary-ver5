import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CarouselWithDotsPage extends StatefulWidget {
  List<String> imgList;

  CarouselWithDotsPage({required this.imgList});

  @override
  _CarouselWithDotsPageState createState() => _CarouselWithDotsPageState();
}

class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {

    final List<Widget> imageSliders = widget.imgList
        .map((item) => GestureDetector(
                        child: Container(
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      child:
                                      Container(
                                          height: 23.h,
                                          width: 95.w,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              image: DecorationImage(
                                                image: NetworkImage(item,),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                                          )
                                      ),
                                    ),

                                    Positioned(
                                      bottom: 0.0,
                                      left: 0.0,
                                      right: 0.0,

                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(200, 0, 0, 0),
                                              Color.fromARGB(0, 0, 0, 0),
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),

                                        padding: EdgeInsets.symmetric(
                                          horizontal: 1.h,
                                           vertical: 2.h,
                                        ),
                                         child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'اضافة نص',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold,
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                             ),
                           ),
        ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10,right: 22,bottom: 10),
          child: Text(
            "الاكثر شيوعأ",
            style: TextStyle(
              color: main_color1,
              fontWeight: FontWeight.bold,
              fontSize: 21.sp,
            ),
          ),
        ),

        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              height: 23.h,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ],
    );
  }
}