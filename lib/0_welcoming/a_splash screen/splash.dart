import 'package:diary/1_home/home_page.dart';
import 'package:diary/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  Future Delay() async{
    await Future.delayed( const Duration(seconds: 3));
    Navigator.push(context, MaterialPageRoute(builder: (context) => bottomN()));
  }
  @override
  void initState(){
    super.initState();
    Delay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_color1,
      body:
      Center(
        child:
        Icon( Icons.house,
          size: 50.sp, color: main_color,),
      )
    );
  }
}
