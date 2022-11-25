import 'package:diary/6_dashboard/add_property/property_type.dart';
import 'package:flutter/material.dart';
//import packages
import 'package:responsive_sizer/responsive_sizer.dart';

//import dart files
import 'package:diary/templates/other_templates.dart';
import 'package:diary/templates/view_building.dart';
import 'package:diary/templates/view_land.dart';
import 'package:diary/templates/view_residential.dart';
import 'package:diary/templates/view_store.dart';

 class post_templates   {
// make a function to build the posts of residential

   static main_post(

       var context,
       String property_type,


       String residential_main_img,
       String residential_type,
       String residential_sell_rent,
       String residential_city,
       String residential_district,
       String residential_location_link,
       String residential_area,
       String residential_interface,
       String residential_depth,
       String residential_price,
       String residential_price_type,
       String residential_room,
       String residential_hall,
       String residential_kitchen,
       String residential_bathroom,
       String residential_garden,
       String residential_carage,
       String residential_owner,
       String residential_owner_phone,
       String residential_property_describtion,
       String residential_property_state,
       String residential_title_deed,

       String store_main_img,
       String store_sell_rent,
       String store_city,
       String store_district,
       String store_location_link,
       String store_area,
       String store_interface,
       String store_depth,
       String store_price,
       String store_price_type,
       String store_owner,
       String store_owner_phone,
       String store_property_describtion,
       String store_property_state,
       String store_title_deed,


       String land_main_img,
       String land_land_type,
       String land_city,
       String land_district,
       String land_location_link,
       String land_area,
       String land_area_type,
       String land_interface,
       String land_depth,
       String land_price,
       String land_price_type,
       String land_owner,
       String land_owner_phone,
       String land_property_describtion,
       String land_property_state,
       String land_title_deed,

       String buildings_main_img,
       String buildings_building_type,
       String buildings_sell_rent,
       String buildings_city,
       String buildings_district,
       String buildings_location_link,
       String buildings_area,
       String buildings_interface,
       String buildings_depth,
       String buildings_price,
       String buildings_price_type,
       String buildings_floors,
       String buildings_owner,
       String buildings_owner_phone,
       String buildings_property_describtion,
       String buildings_property_state,
       String buildings_title_deed,

       ){
       if (property_type== "residential"){
       return  GestureDetector(
         child: Container(
           height: 37.h,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(19))
           ),
           child: Column(
             children: [

               Container(
                   height: 21.h,
                   decoration: BoxDecoration(
                       color: Colors.grey,
                       image: DecorationImage(
                         image: NetworkImage("$residential_main_img",),
                         fit: BoxFit.cover,
                       ),
                       borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                   )
               ),
               Container(
                 decoration: BoxDecoration(
                   boxShadow: [
                     BoxShadow(
                         color: Colors.grey.withOpacity(0.3),
                         blurRadius: 15,
                         spreadRadius: -5
                     )
                   ],
                   gradient: LinearGradient(
                       begin: Alignment.topLeft,
                       end: Alignment.bottomCenter,
                       colors: [Colors.white54.withOpacity(0.3),
                         Colors.white10.withOpacity(0.3)
                       ]
                   ),
                   color: Colors.white70.withOpacity(0.3),
                   borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(19.0),
                       bottomRight: Radius.circular(19.0)),
                 ),

                 child: Column(
                   children: [
                     Padding(padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 0),
                       child:
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("المساحة:$residential_area م² ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Diary_font_color),),
                           Text("$residential_type-$residential_sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Diary_font_color),)
                         ],
                       ),
                     ),

                     Padding(padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 1.h),
                       child:
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("السعر: $residential_price $residential_price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Diary_font_color),),
                           Text("$residential_city-$residential_district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Diary_font_color),),
                         ],
                       ),
                     ),
                     Padding(padding: EdgeInsets.fromLTRB(1.w, 0, 2.w, 1.h),
                       child:
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Row(
                             children: [
                               Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                               Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Diary_font_color),),
                             ],
                           ),

                           Container(
                             height: 4.5.h, width: 18.w,
                             decoration: BoxDecoration(
                                 border: Border.all(color: Colors.grey, width: 2),
                                 borderRadius: BorderRadius.all(Radius.circular(11))
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Text("حمام",style: TextStyle(fontSize: 16.5.sp, color: Diary_font_color),),
                                 Text("$residential_bathroom",style: TextStyle(fontSize: 16.5.sp, color: Diary_font_color),),
                                 Icon(Icons.bathtub_outlined, size: 17.sp, color: Diary_font_color)
                               ],
                             ),
                           ),
                           Container(
                             height:  4.5.h, width: 18.w,
                             decoration: BoxDecoration(
                                 border: Border.all(color: Colors.grey, width: 2),
                                 borderRadius: BorderRadius.all(Radius.circular(11))
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Text("مطبخ",style: TextStyle(fontSize: 16.5.sp),),
                                 Text("$residential_kitchen",style: TextStyle(fontSize: 16.5.sp),),
                                 Icon(Icons.soup_kitchen_outlined, size: 17.sp,)
                               ],
                             ),
                           ),
                           Container(
                             height:  4.5.h, width: 18.w,
                             decoration: BoxDecoration(
                                 border: Border.all(color: Colors.grey, width: 2),
                                 borderRadius: BorderRadius.all(Radius.circular(11))
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Text("صالة",style: TextStyle(fontSize: 16.5.sp),),
                                 Text("$residential_hall",style: TextStyle(fontSize: 16.5.sp),),
                                 Icon(Icons.living_outlined, size: 17.sp,)
                               ],
                             ),
                           ),
                           Container(
                             height:  4.5.h, width: 18.w,
                             decoration: BoxDecoration(
                                 border: Border.all(color: Colors.grey, width: 2),
                                 borderRadius: BorderRadius.all(Radius.circular(11))
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Text("غرف",style: TextStyle(fontSize: 16.5.sp),),
                                 Text("$residential_room",style: TextStyle(fontSize: 16.5.sp),),
                                 Icon(Icons.bed_rounded, size: 19.sp,)
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),

                   ],
                 ),
               )


             ],
           ),
         ),
         onTap: (){
           Navigator.of(context).
           push(MaterialPageRoute(builder: (context) => view_residetial(
             residential_type2: residential_type,
             sell_rent2: residential_sell_rent,
             city2: residential_city,
             district2: residential_district,
             area2: residential_area,
             interface2: residential_interface,
             depth2: residential_depth,
             price2: residential_price,
             price_type2: residential_price_type,
             room2: residential_room,
             hall2: residential_hall,
             kitchen2: residential_kitchen,
             bathroom2: residential_bathroom,
             garden2: residential_garden, carage2: residential_carage,
             owner2: residential_owner, owner_phone2: residential_owner_phone,
             property_describtion2: residential_property_describtion,
             property_state2: residential_property_state,
             location_link2: residential_location_link,
             main_img2: residential_main_img,
             title_deed2: residential_title_deed,
           )));
         },
       );
       }
       else if(property_type=="store"){
         return  GestureDetector(
             child: Container(
               height: 37.h,
               decoration: BoxDecoration(
                   border: Border.all(color: Colors.grey, width: 2),
                   borderRadius: BorderRadius.all(Radius.circular(19))
               ),
               child: Column(
                 children: [

                   Stack(
                     children: [
                       Container(
                           height: 21.h,
                           decoration: BoxDecoration(
                               color: Colors.grey,
                               image: DecorationImage(
                                 image: NetworkImage("$store_main_img",),
                                 fit: BoxFit.cover,
                               ),
                               borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                           )
                       ),
                       Positioned(
                         top: 6,
                         right: 10,
                         child: Container(
                             padding: EdgeInsets.only(left: 0),
                             width: 10.w, height: 5.h,
                             decoration: BoxDecoration(
                                 color: Colors.white.withOpacity(0.7),
                                 borderRadius: BorderRadius.circular(13),
                                 boxShadow: [
                                 ]
                             ),
                             child:
                             Icon( Icons.bookmark_border, color: main_color1, size: 23.sp,)
                         ),
                       )
                     ],
                   ),

                   Padding(padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 4.w, 0),
                     child:
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("المساحة:$store_area م² ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                         Text("متجر-$store_sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                       ],
                     ),
                   ),
                   Padding(padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                     child:
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("السعر: $store_price $store_price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                         Text("$store_city-$store_district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                       ],
                     ),
                   ),
                   Padding(padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 0),
                     child:
                     Row(
                       children: [
                         Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                         Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                       ],
                     ),
                   )


                 ],
               ),
             ),
             onTap:(){
               Navigator.of(context).
               push(MaterialPageRoute(builder: (context) => view_store(
                 sell_rent2: store_sell_rent,
                 city2: store_city, district2: store_district,
                 area2: store_area, interface2: store_interface, depth2: store_depth,
                 location_link2: store_location_link,
                 price2: store_price, price_type2: store_price_type,
                 owner2: store_owner, owner_phone2: store_owner_phone,
                 property_describtion2: store_property_describtion,
                 property_state2: store_property_state,
                 main_img2: store_main_img,
                 title_deed2: store_title_deed,
               )
               )
               );
             }
         );
       }
       else if(property_type=="land"){
         return GestureDetector(
           child: Container(
             height: 37.h,
             decoration: BoxDecoration(
                 border: Border.all(color: secondary_color1, width: 2),
                 borderRadius: BorderRadius.all(Radius.circular(19))
             ),
             child: Column(
               children: [
                 // img
                 Stack(
                   children: [
                     Container(
                         height: 21.h,
                         decoration: BoxDecoration(
                             color: Colors.grey,
                             image: DecorationImage(
                               image: NetworkImage("$land_main_img",),
                               fit: BoxFit.cover,
                             ),
                             borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                         )
                     ),
                     Positioned(
                       top: 6,
                       right: 10,
                       child: Container(
                           padding: EdgeInsets.only(left: 0),
                           width: 10.w, height: 5.h,
                           decoration: BoxDecoration(
                               color: Colors.white.withOpacity(0.7),
                               borderRadius: BorderRadius.circular(13),
                               boxShadow: [
                               ]
                           ),
                           child:
                           Icon( Icons.bookmark_border, color: main_color1, size: 23.sp,)
                       ),
                     )
                   ],
                 ),

                 // land type & area
                 Padding(padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 4.w, 0),
                   child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("المساحة:$land_area م² ", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),),
                       Text("ارض-$land_land_type", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),)
                     ],
                   ),
                 ),
                 Padding(padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                   child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("السعر: $land_price $land_price_type", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),),
                       Text("$land_city-$land_district", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),),
                     ],
                   ),
                 ),
                 Padding(padding: EdgeInsets.fromLTRB(4.w, 0.5.h, 4.w, 0.5.h),
                   child:
                   Row(
                     children: [
                       Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                       Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                     ],
                   ),
                 )
               ],
             ),
           ),
           onTap: (){
             Navigator.of(context).
             push(MaterialPageRoute(builder: (context) =>  view_land(
               land_type2: land_land_type,
               city2: land_city,
               district2: land_district,
               location_link2: land_location_link,
               area2: land_area,
               interface2: land_interface,
               depth2: land_depth,
               area_type2: land_area_type,
               price2: land_price,
               price_type2: land_price_type,
               owner2: land_owner,
               owner_phone2: land_owner_phone,
               property_describtion2: land_property_describtion,
               property_state2: land_property_state,
               main_img2: land_main_img,
               title_deed2: land_title_deed,
             )
             )
             );
           },
         );
       }
       else{
         return GestureDetector(
           child: Container(
             height: 37.h,
             decoration: BoxDecoration(
                 border: Border.all(color: Colors.grey, width: 2),
                 borderRadius: BorderRadius.all(Radius.circular(19))
             ),
             child: Column(
               children: [

                 Stack(
                   children: [
                     Container(
                         height: 21.h,
                         decoration: BoxDecoration(
                             color: Colors.grey,
                             image: DecorationImage(
                               image: NetworkImage("$buildings_main_img",),
                               fit: BoxFit.cover,
                             ),
                             borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                         )
                     ),
                     Positioned(
                       top: 6,
                       right: 10,
                       child: Container(
                           padding: EdgeInsets.only(left: 0),
                           width: 10.w, height: 5.h,
                           decoration: BoxDecoration(
                               color: Colors.white.withOpacity(0.7),
                               borderRadius: BorderRadius.circular(13),
                               boxShadow: [
                               ]
                           ),
                           child:
                           Icon( Icons.bookmark_border, color: main_color1, size: 23.sp,)
                       ),
                     )
                   ],
                 ),

                 Padding(padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 4.w, 0),
                   child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("المساحة:$buildings_area م² ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                       Text("مبنى-$buildings_building_type-$buildings_sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                     ],
                   ),
                 ),
                 Padding(padding: EdgeInsets.fromLTRB(4.w, 0.5.h, 4.w, 0),
                   child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("السعر: $buildings_price $buildings_price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                       Text("$buildings_city-$buildings_district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                     ],
                   ),
                 ),
                 Padding(padding: EdgeInsets.fromLTRB(4.w, 0.5.h, 4.w, 0),
                   child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                           Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                         ],
                       ),
                       Container(
                         height: 4.5.h, width: 25.w,
                         decoration: BoxDecoration(
                             border: Border.all(color: Colors.grey, width: 2),
                             borderRadius: BorderRadius.all(Radius.circular(11))
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Text("طابق", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                             Text("$buildings_floors", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                             Icon(Icons.layers, size: 19.sp,)
                           ],
                         ),
                       ),
                     ],
                   ),
                 )
               ],
             ),
           ),
           onTap: (){
             Navigator.of(context).
             push(MaterialPageRoute(builder: (context) =>   view_building(
               building_type2: buildings_building_type,
               sell_rent2: buildings_sell_rent,
               city2: buildings_city, district2: buildings_district, location_link2: buildings_location_link,
               area2: buildings_area, interface2: buildings_interface, depth2: buildings_depth,
               price2: buildings_price, price_type2: buildings_price_type,
               floors2: buildings_floors,
               owner2: buildings_owner, owner_phone2: buildings_owner_phone,
               property_describtion2: buildings_property_describtion,
               property_state2: buildings_property_state,
               main_img2: buildings_main_img,
               title_deed2: buildings_title_deed,
             )
             )
             );
           },
         );
       }

   }

   static post_residential(var context,

       String residential_main_img,
       String residential_type,
       String residential_sell_rent,
       String residential_city,
       String residential_district,
       String residential_location_link,
       String residential_area,
       String residential_interface,
       String residential_depth,
       String residential_price,
       String residential_price_type,
       String residential_room,
       String residential_hall,
       String residential_kitchen,
       String residential_bathroom,
       String residential_garden,
       String residential_carage,
       String residential_owner,
       String residential_owner_phone,
       String residential_property_describtion,
       String residential_property_state,
       String residential_title_deed,
       )
   {
     return  GestureDetector(
       child: Container(
         height: 37.h,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(19))
         ),
         child: Column(
           children: [

             Container(
                 height: 21.h,
                 decoration: BoxDecoration(
                     color: Color(0xFF6C804B),
                     image: DecorationImage(
                       image: NetworkImage("$residential_main_img",),
                       fit: BoxFit.cover,
                     ),

                     borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                 )
             ),

             Container(
               decoration: BoxDecoration(
                 border: Border.all(color: Color(0xFF6C804B).withOpacity(0.3), width: 2),
                 boxShadow: [
                   BoxShadow(
                     color: Color(0xFF6C804B).withOpacity(0.3),
                     blurRadius: 15,
                     spreadRadius: -5
                   )
                 ],
                 gradient: LinearGradient(
                     begin: Alignment.topLeft,
                     end: Alignment.bottomCenter,
                     colors: [Color(0xFF6C804B).withOpacity(0.3),
                       Colors.white10.withOpacity(0.3)
                     ]
                 ),
                 color: Color(0xFF6C804B).withOpacity(0.3),
                 borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(19.0),
                     bottomRight: Radius.circular(19.0)),
               ),

               child: Column(
                 children: [
                   Padding(padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 0),
                     child:
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("المساحة:$residential_area م² ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Diary_font_color),),
                         Text("$residential_type-$residential_sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Diary_font_color),)
                       ],
                     ),
                   ),

                   Padding(padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 1.h),
                     child:
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("السعر: $residential_price $residential_price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Diary_font_color),),
                         Text("$residential_city-$residential_district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Diary_font_color),),
                       ],
                     ),
                   ),
                   Padding(padding: EdgeInsets.fromLTRB(1.w, 0, 2.w, 1.h),
                     child:
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Row(
                           children: [
                             Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                             Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Diary_font_color),),
                           ],
                         ),

                         Container(
                           height: 4.5.h, width: 18.w,
                           decoration: BoxDecoration(
                               border: Border.all(color: Color(0xFF6C804B).withOpacity(0.5), width: 1.5),
                               borderRadius: BorderRadius.all(Radius.circular(11))
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Text("حمام",style: TextStyle(fontSize: 16.5.sp, color: Diary_font_color),),
                               Text("$residential_bathroom",style: TextStyle(fontSize: 16.5.sp, color: Diary_font_color),),
                               Icon(Icons.bathtub_outlined, size: 17.sp, color: Diary_font_color)
                             ],
                           ),
                         ),
                         Container(
                           height:  4.5.h, width: 18.w,
                           decoration: BoxDecoration(
                               border: Border.all(color: Color(0xFF6C804B).withOpacity(0.5), width: 1.5),
                               borderRadius: BorderRadius.all(Radius.circular(11))
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Text("مطبخ",style: TextStyle(fontSize: 16.5.sp),),
                               Text("$residential_kitchen",style: TextStyle(fontSize: 16.5.sp),),
                               Icon(Icons.soup_kitchen_outlined, size: 17.sp,)
                             ],
                           ),
                         ),
                         Container(
                           height:  4.5.h, width: 18.w,
                           decoration: BoxDecoration(
                               border: Border.all(color: Color(0xFF6C804B).withOpacity(0.5), width: 1.5),
                               borderRadius: BorderRadius.all(Radius.circular(11))
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Text("صالة",style: TextStyle(fontSize: 16.5.sp),),
                               Text("$residential_hall",style: TextStyle(fontSize: 16.5.sp),),
                               Icon(Icons.living_outlined, size: 17.sp,)
                             ],
                           ),
                         ),
                         Container(
                           height:  4.5.h, width: 18.w,
                           decoration: BoxDecoration(
                               border: Border.all(color: Color(0xFF6C804B).withOpacity(0.5), width: 1.5),
                               borderRadius: BorderRadius.all(Radius.circular(11))
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Text("غرف",style: TextStyle(fontSize: 16.5.sp),),
                               Text("$residential_room",style: TextStyle(fontSize: 16.5.sp),),
                               Icon(Icons.bed_rounded, size: 19.sp,)
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),

                 ],
               ),
             )


           ],
         ),
       ),
       onTap: (){
         Navigator.of(context).
         push(MaterialPageRoute(builder: (context) => view_residetial(
             residential_type2: residential_type,
             sell_rent2: residential_sell_rent,
             city2: residential_city,
             district2: residential_district,
             area2: residential_area,
             interface2: residential_interface,
             depth2: residential_depth,
             price2: residential_price,
             price_type2: residential_price_type,
             room2: residential_room,
             hall2: residential_hall,
             kitchen2: residential_kitchen,
             bathroom2: residential_bathroom,
             garden2: residential_garden, carage2: residential_carage,
             owner2: residential_owner, owner_phone2: residential_owner_phone,
             property_describtion2: residential_property_describtion,
             property_state2: residential_property_state,
             location_link2: residential_location_link,
             main_img2: residential_main_img,
             title_deed2: residential_title_deed,
         )));
       },
     );


   }

   // make a function to build the posts of store

   static post_store(var context,
       String store_main_img,
       String store_sell_rent,
       String store_city,
       String store_district,
       String store_location_link,
       String store_area,
       String store_interface,
       String store_depth,
       String store_price,
       String store_price_type,
       String store_owner,
       String store_owner_phone,
       String store_property_describtion,
       String store_property_state,
       String store_title_deed,
       )
   {
     return GestureDetector(
         child: Container(

           child: Container(
             height: 37.h,
             decoration: BoxDecoration(
                 border: Border.all(color: Colors.grey, width: 2),
                 borderRadius: BorderRadius.all(Radius.circular(19))
             ),
             child: Column(
               children: [

                 Stack(
                   children: [
                     Container(
                         height: 21.h,
                         decoration: BoxDecoration(
                             color: Colors.grey,
                             image: DecorationImage(
                               image: NetworkImage("$store_main_img",),
                               fit: BoxFit.cover,
                             ),
                             borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                         )
                     ),
                     Positioned(
                       top: 6,
                       right: 10,
                       child: Container(
                           padding: EdgeInsets.only(left: 0),
                           width: 10.w, height: 5.h,
                           decoration: BoxDecoration(
                               color: Colors.white.withOpacity(0.7),
                               borderRadius: BorderRadius.circular(13),
                               boxShadow: [
                               ]
                           ),
                           child:
                           Icon( Icons.bookmark_border, color: main_color1, size: 23.sp,)
                       ),
                     )
                   ],
                 ),

                 Padding(padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 4.w, 0),
                   child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("المساحة:$store_area م² ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                       Text("متجر-$store_sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                     ],
                   ),
                 ),
                 Padding(padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                   child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("السعر: $store_price $store_price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                       Text("$store_city-$store_district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                     ],
                   ),
                 ),
                 Padding(padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 0),
                   child:
                   Row(
                     children: [
                       Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                       Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                     ],
                   ),
                 )


               ],
             ),
           ),
         ),
         onTap:(){
           Navigator.of(context).
           push(MaterialPageRoute(builder: (context) => view_store(
             sell_rent2: store_sell_rent,
             city2: store_city, district2: store_district,
             area2: store_area, interface2: store_interface, depth2: store_depth,
             location_link2: store_location_link,
             price2: store_price, price_type2: store_price_type,
             owner2: store_owner, owner_phone2: store_owner_phone,
             property_describtion2: store_property_describtion,
             property_state2: store_property_state,
             main_img2: store_main_img,
             title_deed2: store_title_deed,
           )
           )
           );
         }
     );

   }


   // make a function to build the posts of land
  static post_land(var context,
      String land_main_img,
      String land_land_type,
      String land_city,
      String land_district,
      String land_location_link,
      String land_area,
      String land_area_type,
      String land_interface,
      String land_depth,
      String land_price,
      String land_price_type,
      String land_owner,
      String land_owner_phone,
      String land_property_describtion,
      String land_property_state,
      String land_title_deed,
      )
  {

    return GestureDetector(
      child: Container(
        height: 37.h,
        decoration: BoxDecoration(
            border: Border.all(color: secondary_color1, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(19))
        ),
        child: Column(
          children: [
            // img
            Stack(
              children: [
                Container(
                    height: 21.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage("$land_main_img",),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                    )
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: Container(
                      padding: EdgeInsets.only(left: 0),
                      width: 10.w, height: 5.h,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                          ]
                      ),
                      child:
                      Icon( Icons.bookmark_border, color: main_color1, size: 23.sp,)
                  ),
                )
              ],
            ),

            // land type & area
            Padding(padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 4.w, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المساحة:$land_area م² ", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),),
                  Text("ارض-$land_land_type", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("السعر: $land_price $land_price_type", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),),
                  Text("$land_city-$land_district", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(4.w, 0.5.h, 4.w, 0.5.h),
              child:
              Row(
                children: [
                  Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                  Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).
        push(MaterialPageRoute(builder: (context) =>  view_land(
            land_type2: land_land_type,
            city2: land_city,
            district2: land_district,
            location_link2: land_location_link,
            area2: land_area,
            interface2: land_interface,
            depth2: land_depth,
            area_type2: land_area_type,
            price2: land_price,
            price_type2: land_price_type,
            owner2: land_owner,
            owner_phone2: land_owner_phone,
            property_describtion2: land_property_describtion,
            property_state2: land_property_state,
            main_img2: land_main_img,
            title_deed2: land_title_deed,
         )
         )
        );
      },
    );
  }

// make a function to build the posts of buildings

  static post_buildings(var context,
      String buildings_main_img,
      String buildings_building_type,
      String buildings_sell_rent,
      String buildings_city,
      String buildings_district,
      String buildings_location_link,
      String buildings_area,
      String buildings_interface,
      String buildings_depth,
      String buildings_price,
      String buildings_price_type,
      String buildings_floors,
      String buildings_owner,
      String buildings_owner_phone,
      String buildings_property_describtion,
      String buildings_property_state,
      String buildings_title_deed,
      )
  {
    return GestureDetector(
      child: Container(
        height: 37.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(19))
        ),
        child: Column(
          children: [

            Stack(
              children: [
                Container(
                    height: 21.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage("$buildings_main_img",),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                    )
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: Container(
                      padding: EdgeInsets.only(left: 0),
                      width: 10.w, height: 5.h,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                          ]
                      ),
                      child:
                      Icon( Icons.bookmark_border, color: main_color1, size: 23.sp,)
                  ),
                )
              ],
            ),

            Padding(padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 4.w, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المساحة:$buildings_area م² ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                  Text("مبنى-$buildings_building_type-$buildings_sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(4.w, 0.5.h, 4.w, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("السعر: $buildings_price $buildings_price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                  Text("$buildings_city-$buildings_district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(4.w, 0.5.h, 4.w, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                      Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Container(
                    height: 4.5.h, width: 25.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(11))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("طابق", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                        Text("$buildings_floors", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                        Icon(Icons.layers, size: 19.sp,)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).
        push(MaterialPageRoute(builder: (context) =>   view_building(
            building_type2: buildings_building_type,
            sell_rent2: buildings_sell_rent,
            city2: buildings_city, district2: buildings_district, location_link2: buildings_location_link,
            area2: buildings_area, interface2: buildings_interface, depth2: buildings_depth,
            price2: buildings_price, price_type2: buildings_price_type,
            floors2: buildings_floors,
            owner2: buildings_owner, owner_phone2: buildings_owner_phone,
            property_describtion2: buildings_property_describtion,
            property_state2: buildings_property_state,
            main_img2: buildings_main_img,
            title_deed2: buildings_title_deed,
        )
          )
        );
      },
    );
  }
}
