import 'package:diary/2_account/e_account%20details/information%20section/my_properties.dart';
import 'package:diary/5_saved/saved.dart';
import 'package:diary/6_dashboard/add_property/property_type.dart';
import 'package:diary/6_dashboard/payment/payment_type.dart';
import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';
import 'package:diary/1_home/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../dataa.dart';

class bottomN extends StatefulWidget {

  @override
  State<bottomN> createState() => _bottomNState();
}

class _bottomNState extends State<bottomN> {

  var cureentIndex = 3;

  final screens = [
    my_properties(),
    subscription_state ?  property_type() : payment_type(),
    saved(),
    home_page(uname: '', uphone: '',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: cureentIndex,
        children: screens,
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cureentIndex,
        onTap: (v){
          setState(() {
            cureentIndex = v;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: main_color0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        iconSize: 23.sp,
        selectedFontSize: 14.sp,
        unselectedFontSize: 12.sp,
        showUnselectedLabels: false,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_rounded,),
            label: 'عقاراتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, ),
            label: 'اضافة عقار',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks_outlined,),
            label: 'المحفوظ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, ),
            label: 'الرئيسية',
          ),
        ],
      ),
    );
  }
}
