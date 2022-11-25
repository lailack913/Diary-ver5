import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Styling template
Color Diary_appbar_color= Color(0xFF6C804B);
Color Diary_button_color= Color(0xFF6C804B);
Color Diary_font_color= Colors.black54;
Color main_color = Color(0xFF6C804B);
Color main_color0 = Color(0xFF4C5B34);
Color main_color1 = Color(0xFF6C804B);
Color main_color2 = Color(0xFFABB868);
Color main_color4 = Color(0xFFE8E0A1);
Color main_color3 = Color(0xFFE5F7D1);
Color secondary_color1 = Color(0xFF504F46);
Color secondary_color2 = Color(0xFF777569);
Color secondary_color3 = Colors.white70;


class other_templates{

  static height(var context){
    var height=MediaQuery.of(context).size.height;
    return height;
  }
  static width(var context){
    var width=MediaQuery.of(context).size.width;
    return width;
  }

  /// for payment type
  static choice_title_script( double height, double width,
      String title, String script,
      double title_size, double script_size ){
    return Container(
      height: height, width: width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 3)
      ),

      padding: EdgeInsets.all(11),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("$title",style: TextStyle(fontSize: title_size),),
          Text("$script",
            style: TextStyle(fontSize: script_size), textAlign: TextAlign.right,)

        ],
      ),
    );
  }


// in property_type.dart
  static property_choices( double height, double width,
      String title, String script,
      double title_size, double script_size ){
    return Container(
      height: height, width: width,
      decoration: BoxDecoration(
          color: main_color1,
          border: Border.all(color: Colors.grey.shade300, width: 3),
          borderRadius: BorderRadius.circular(19)
      ),

      margin: EdgeInsets.only(top: 11),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$title",style: TextStyle(fontSize: title_size,color: Colors.white),),
          Text("$script",
            style: TextStyle(fontSize: script_size, color: Colors.white70), textAlign: TextAlign.right,)

        ],
      ),
    );
  }




  static selsection(double height, double width, double fs,
      String type, bool isPressed,
      )
  {
    return
      Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: (isPressed == true ) ? main_color1 : Colors.grey, width: 3),
          ),
          child:
          Center(
            child:
            Text("$type",  style: TextStyle(
              fontSize: fs , color: (isPressed == true ) ? main_color1 : Colors.grey,
            ),),
          )
      );
  }

  static tow_choices_bar(bool detector, var detected,
      String choice1, String choice2){
    return  Container(
      height: 4.h, width: 27.w,
      decoration: BoxDecoration(
        border: Border.all( color: Colors.grey, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 12.7.w,
              color: !detector ? Colors.teal.shade300: Colors.white,
              alignment: Alignment.center,
              child: Text(choice2,style: TextStyle(fontSize: !detector ? 18.sp: 16.sp,
                                                     color: !detector ? Colors.white: Colors.black
              ),)),
          Container(height: 3.h, width: 0.7.w,color: Colors.grey,),
          Container(
              width: 12.7.w,
              color: detector ? Colors.teal.shade300: Colors.white,
              alignment: Alignment.center,
              child:
              Text(choice1,style: TextStyle(fontSize: detector ? 18.sp: 16.sp,
                                             color: detector ? Colors.white: Colors.black

              ),)
          ),
        ],
      ),
    );

  }

  // textfield
  static Diary_TextField(var controller,String lable){
    return TextField(
        controller: controller,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
        labelText: lable,
        labelStyle: TextStyle(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal.shade300, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
    )
    );
  }
}