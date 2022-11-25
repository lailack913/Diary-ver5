import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/6_dashboard/add_property/preview_land.dart';
import 'package:diary/6_dashboard/add_property/preview_store.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:diary/templates/other_templates.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'dart:convert';


var area_Controller = TextEditingController();
var interface_Controller = TextEditingController();
var depth_Controller = TextEditingController();
var price_Controller = TextEditingController();
var city_Controller = TextEditingController();
var district_Controller = TextEditingController();
var location_link_Controller = TextEditingController();
var describtion_Controller  = TextEditingController();

class form_store extends StatefulWidget {
  const form_store({Key? key}) : super(key: key);

  @override
  State<form_store> createState() => _form_storeState();
}

class _form_storeState extends State<form_store> {

  /// main var
  String _sell_rent="للبيع";
  String _price_type = "الف";
  String _city="";
  String _district="";

  /// thse vars re helping to set values for the main vars

  bool _b_price_type = true; /// <<< true=thousand, false=million

  /// defult choice will be the sell
  bool _b_sell_rent=true; /// <<< true=sell, false=rent
  ///
  ///
  /// photo vars
  PlatformFile? mainImg;
  PlatformFile? title_deed;
  List<File> images = [];

  /// photo upload functions
  ///
  /// for main img select then upload

  Future mainImg_selector() async {
    final result = await FilePicker.platform.pickFiles();
    if (result==null) return print("file is null");
    setState(() {
      mainImg = result.files.first;
    });
  }


  /// for main img select then upload

  Future title_deed_selector() async {
    final result = await FilePicker.platform.pickFiles();
    if (result==null) return print("file is null");
    setState(() {
      title_deed = result.files.first;
    });
  }

  /// post images
  final ImagePicker _picker = ImagePicker();

  getMultipImage() async {
    final List<XFile>? pickedImages = await _picker.pickMultiImage();

    if (pickedImages != null) {
      pickedImages.forEach((e) {
        images.add(File(e.path));
      });

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Diary_appbar_color,

        actions: [
          Padding(
              padding: EdgeInsets.only(top: 9,right: 9),
              child: Text("اضافة عقار - متجر",style: TextStyle(fontSize: 20.sp),))
        ],
      ),

      body: SafeArea(
        child:
        SingleChildScrollView(
          child:
          Container(
              padding: EdgeInsets.all(30),
              width: other_templates.width(context),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  // set _sell_rent withe help of _b_sell_rent
                  Text(":هل تود",style: TextStyle(fontSize: 23.sp),),
                  SizedBox(height: 0.5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: other_templates.selsection(
                            other_templates.height(context)/13,
                            other_templates.width(context)/2.5,
                            23.sp, "البيع", _b_sell_rent),
                        onTap: (){
                          setState(() {
                            _sell_rent="للبيع";
                            _b_sell_rent=true;
                          });
                        },
                      ),
                      GestureDetector(
                        child: other_templates.selsection(
                            other_templates.height(context)/13,
                            other_templates.width(context)/2.5,
                            23.sp, "التاجير", !_b_sell_rent),
                        onTap: (){
                          setState(() {
                            _sell_rent="للايجار";
                            _b_sell_rent=false;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 1.h,),



                  Text(":المساحةالكلية بالمتر المربع",style: TextStyle(fontSize: 21.sp),),
                  other_templates.Diary_TextField(area_Controller, ''),
                  SizedBox(height: 1.h,),



                  // interface & depth
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 27.w,
                        width: 37.w,
                        child:  Column(
                          crossAxisAlignment:CrossAxisAlignment.end,
                          children: [
                            Text(":الواجهة",style: TextStyle(fontSize: 21.sp),),
                            other_templates.Diary_TextField(interface_Controller, '')
                          ],
                        ),
                      ),

                      SizedBox(width: 3.w,),

                      Container(
                        height: 27.w,
                        width: 37.w,
                        child:
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.end,
                          children: [
                            Text(":النزال",style: TextStyle(fontSize: 21.sp),),

                            other_templates.Diary_TextField(depth_Controller, '')

                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 2.h,),



                  // set _price_type with help of _b_price_type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: other_templates.tow_choices_bar(
                            _b_price_type, _price_type, "الف", "مليون"
                        ),
                        onTap:(){
                          setState(() {
                            _b_price_type=!_b_price_type;
                            _b_price_type? _price_type= " الف د.ع  ": _price_type= " مليون د.ع ";
                          });
                        },
                      ),
                      Text(":السعر بالدينار العراقي",style: TextStyle(fontSize: 23),),
                    ],
                  ),
                  SizedBox(height: 0.7.h,),
                  other_templates.Diary_TextField(price_Controller, ''),


                  SizedBox(height: 1.h,),

                  // set location by city & distract & location link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 27.w,
                        width: 37.w,
                        child:  Column(
                          crossAxisAlignment:CrossAxisAlignment.end,
                          children: [
                            Text("المنطقة",style: TextStyle(fontSize: 21.sp),),
                            other_templates.Diary_TextField(district_Controller, '')

                          ],
                        ),
                      ),

                      SizedBox(width: 3.w,),

                      Container(
                        height: 27.w,
                        width: 37.w,
                        child:
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.end,
                          children: [
                            Text(":المدينة",style: TextStyle(fontSize: 21.sp),),
                            other_templates.Diary_TextField( city_Controller, '')

                          ],
                        ),
                      )
                    ],
                  ),
                  Text(":رابط الموقع",style: TextStyle(fontSize: 21.sp),),
                  other_templates.Diary_TextField(location_link_Controller, ''),


                  SizedBox(height: 3.h,),


                  // select pictures
                  Text(":اضافة الصورة الرئيسية",style: TextStyle(fontSize: 19),),
                  Container(
                    width: 50.w,
                    child: ElevatedButton(
                        onPressed: mainImg_selector,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(mainImg!= null? "تم اختيار الصورة":"اختيار صورة من المعرض",),
                            Icon(Icons.image)
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: mainImg!= null? Colors.teal.shade200 : Diary_button_color
                        )
                    ),
                  ),
                  Row(
                    children: [
                      if (mainImg != null)
                        Expanded(
                            child: Container(
                                color: Colors.teal,
                                child: Image.file(
                                  File(mainImg!.path!),
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                            )
                        )
                    ],
                  ),

                  SizedBox(height: 1.h,),

                  Text(":اضافة صور للمتجر",style: TextStyle(fontSize: 23),),

                  InkWell(
                    onTap: () {
                      getMultipImage();
                    },
                    child:
                    Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Icon(
                            Icons.upload_file,
                            size: 50,
                          ),
                        )),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: Get.width,
                    height: 150,
                    child: images.length == 0
                        ? Center(
                      child: Text("لم يتم اختيار صور بعد"),
                    )
                        : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) {

                        return Container(
                            width: 100,
                            margin: EdgeInsets.only(right: 10),
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),


                            child: Image.file(
                              images[i],
                              fit: BoxFit.cover,
                            ));
                      },
                      itemCount: images.length,


                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),


                  SizedBox(height: 1.h,),


                  Text(":اضافة سندات ثبوت الملكية",style: TextStyle(fontSize: 23),),
                  Container(
                    width: 50.w,
                    child: ElevatedButton(
                        onPressed: title_deed_selector,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(title_deed!= null? "تم اختيار الصورة":"اختيار صورة من المعرض",),
                            Icon(Icons.image)
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: title_deed!= null? Colors.teal.shade200 : Diary_button_color
                        )
                    ),
                  ),

                  Row(
                    children: [
                      if (title_deed != null)
                        Expanded(
                            child: Container(
                                color: Colors.teal,
                                child: Image.file(
                                  File(title_deed!.path!),
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                            )
                        )
                    ],
                  ),

                  SizedBox(height: 1.h,),

                  //set description
                  Text(
                    ":اضافة وصف لللمتجر",
                    style: TextStyle(fontSize: 23),
                  ),

                  Container(
                    height: 150,
                    child: TextField(
                        controller: describtion_Controller,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          labelText: '',
                          labelStyle: TextStyle(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal.shade300, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                        )
                    ),
                  ),

                  SizedBox(height: 3.h,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            setState(() {
                              Navigator.of(context).
                              push(MaterialPageRoute(builder: (context) => preview_store(
                                  sell_rent2: _sell_rent,
                                  city2: city_Controller.text,
                                  district2: district_Controller.text,
                                  area2: area_Controller.text,
                                  interface2: interface_Controller.text,
                                  depth2: depth_Controller.text,
                                  location_link2: location_link_Controller.text,
                                  price2: price_Controller.text,
                                  price_type2: _price_type,
                                  owner2: "database",
                                  owner_phone2: "database",
                                  property_describtion2: describtion_Controller.text,
                                  property_state2: "false",
                                  images2: images,
                                  main_img2: mainImg,
                                  title_deed2: title_deed,
                              )

                              )
                              );
                            });
                          },
                          child:
                          Text("معاينة",style: TextStyle(fontSize: 23),),
                          style: ElevatedButton.styleFrom(
                              primary: Diary_button_color
                          )
                      )
                    ],
                  ),

                  SizedBox(height: 1.h,),

                ],
              )
          ),
        ),
      ),

    );
  }
}