import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/dataa.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:diary/templates/other_templates.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:responsive_sizer/responsive_sizer.dart';



class previw_building extends StatefulWidget {


  final String  building_type2;
  final  String sell_rent2;
  final String  city2;
  final String  district2;
  final String location_link2;
  final String area2;
  final String interface2;
  final String depth2;
  final String price2;
  final String price_type2;
  final String floors2;
  final PlatformFile? main_img2;
  final PlatformFile? title_deed2;
  final String owner2;
  final String owner_phone2;
  final String property_describtion2;
   String property_state2;
  List<File> images2 = [];





  previw_building ({

    required this.building_type2,
    required this.sell_rent2,
    required this.city2,
    required this.district2,
    required this.location_link2, /// must be between single quotations '' not double ""
    required this.area2,
    required this.interface2,
    required this.depth2,
    required this.price2,
    required this.price_type2,
    required this.floors2,
    required this.main_img2,
    required this.title_deed2,
    required this.owner2,
    required this.owner_phone2,
    required this.property_describtion2,
    required this.property_state2,
    required this.images2,

  });
  @override
  State<previw_building> createState() => _previw_buildingState();
}

class _previw_buildingState extends State<previw_building> {

  /// upload images vars
  UploadTask? uploadTask;
  List<String> downloadUrls = [];
  String? post_image_url;

  /// upload images functions
  Future mainImg_uploader() async {
    final path = 'Building_main_image/${widget.main_img2!.name}';
    final file = File(widget.main_img2!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask =  ref.putFile(file);
    });

    final snapsht = await uploadTask!.whenComplete(() {});
    final urlDowmload = await snapsht.ref.getDownloadURL();
    building_main_img = urlDowmload;
    print('building_main_img link: $building_main_img ');

    setState(() {
      uploadTask = null;
    });
    print("file uploaded");
    print("mainImg  uploaded");
  }

  Future title_deed_uploader() async {
    final path = 'Building_title_deed/${widget.title_deed2!.name}';
    final file = File(widget.title_deed2!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask =  ref.putFile(file);
    }
    );

    final snapsht = await uploadTask!.whenComplete(() {});
    final urlDowmload = await snapsht.ref.getDownloadURL();
    building_title_deed = urlDowmload;
    print('building_title_deed link: $building_title_deed ');

    setState(() {
      uploadTask = null;
    });
    print("file uploaded");
    print("mainImg  uploaded");
  }

  Future<String> uploadFile(File file) async {

    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('Building_posts_images/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;

  }



  /// url functions and var
  Future<void>? _launched;
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }


  /// send data to database

  Future Add_data() async {

    var url = Uri.parse("https://diary.dnascholarship.ae/add/b");
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"building_type": "$building_type",'
        ' "building_sell_rent": "$building_sell_rent",'
        ' "building_city": "$building_city",'
        ' "building_district": "$building_district"'
        ' "building_location_link": "$building_location_link" '
        '  "building_area": "$building_area"'
        '  "building_interface": "$building_interface"'
        '  "building_depth": "$building_depth"'
        '  "building_price": "$building_price"'
        '  "building_price_type": "$building_price_type"'
        '  "building_floors": "$building_floors"'
        '  "building_main_img": "$building_main_img"'
        '  "building_title_deed": "$building_title_deed"'
        '  "building_description": "$building_description"'
        '  "owner_name": "$building_owner_name" '
        '  "owner_phone": "$building_owner_phone"'
        '  "property_state": "$building_property_state"'
        '  "client_name": "$building_client_name"'
        '  "client_phone": "$building_client_phone"}';

    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body1 = response.body;
    var data = jsonDecode(body1);
    print(data);
    var res = data["code"];

    if (res == null) {}
  }

  Future Add_post_img(String  post_images ) async {
    var url = Uri.parse("https://diary.dnascholarship.ae/add/b/img");
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"images": "$building_post_images"}';

    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body1 = response.body;
    var data = jsonDecode(body1);
    print(data);
    var res = data["code"];
    if (res == null) {}
  }


  @override
  Widget build(BuildContext context) {


    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.
    final Uri toLaunch =
    Uri(scheme: 'https', host: widget.location_link2, );  /// <<<<<<<<<<<<<<<!!! here will be the location link
    ///
    ///
    ///
    ///


    return Scaffold(
        body:
        SafeArea(
          child: Container(
              child: ListView(
                children: [

                  Container(
                    width: 100.w,
                    height: 45.h,
                    child: widget.images2.length == 0
                        ? Center(
                      child: Text("لم يتم اختيار صور بعد"),
                    )
                        : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) {
                        return Container(
                            width: 100.w,
                            margin: EdgeInsets.only(right: 10),
                            height: 50.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),

                            child: Image.file(
                              widget.images2[i],
                              fit: BoxFit.cover,
                            ));
                      },
                      itemCount: widget.images2.length,


                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(0, 33, 19, 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(widget.building_type2+" - "+widget.sell_rent2,style: TextStyle(fontSize: 27),),
                        Text(widget.city2+" - "+widget.district2,style: TextStyle(fontSize: 27),),
                        Text(" السعر: ${widget.price2}"+widget.price_type2,style: TextStyle(fontSize: 27),),
                        Text("المساحة: ${widget.area2} م²", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.end,
                          children: [
                            Text("النزال: ${widget.interface2} م ", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),),
                            SizedBox(width: other_templates.width(context)/20,),
                            Text("الواجهة: ${widget.depth2} م ", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container( height: 7, color: Colors.grey.shade300,),

                  Padding(padding: EdgeInsets.fromLTRB(0, 17, 0, 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Link(
                          uri: Uri.parse(
                              'https://pub.dev/documentation/url_launcher/latest/link/link-library.html'),
                          target: LinkTarget.blank,
                          builder: (BuildContext ctx, FollowLink? openLink) {
                            return TextButton.icon(
                              onPressed: () => setState(() {
                                _launched = _launchInBrowser(toLaunch);
                              }),
                              label: const Text('رابط الموقع',style: TextStyle(fontSize:27),),
                              icon: const Icon(Icons.read_more,color: Colors.white,),
                            );
                          },
                        ),
                        Image(
                            height: 70, width: 70,
                            image: NetworkImage("https://cdn.pixabay.com/photo/2016/03/22/04/23/map-1272165_960_720.png")),

                        Padding(padding: EdgeInsets.all(16.0)),
                        FutureBuilder<void>(future: _launched, builder: _launchStatus),
                      ],
                    ),
                  ),
                  Container( height: 7, color: Colors.grey.shade300,),
                  Padding(padding: EdgeInsets.fromLTRB(0, 17, 37, 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(":معلومات اخرى",style: TextStyle(fontSize:27),),
                        Text(widget.property_describtion2,style: TextStyle(fontSize:17),textAlign: TextAlign.right ,)
                      ],
                    ),
                  ),
                  Container( height: 7, color: Colors.grey.shade300,),
                  Padding(padding: EdgeInsets.fromLTRB(0, 17, 37, 19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("ًالمالك: "+widget.owner2,style: TextStyle(fontSize:23),),
                        Text("رقم الهاتف: "+widget.owner_phone2,style: TextStyle(fontSize:23),),

                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 9.h,
                          width: 50.w,
                          color: Colors.green,
                          child: Center(
                            child: Text("تعديل",style: TextStyle(fontSize: 29),) ,
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pop();
                        },


                      ),

                      GestureDetector(
                        child: Container(
                          height: 9.h,
                          width: 50.w,
                          color: Colors.green,
                          child: Center(
                            child: Text("نشر",style: TextStyle(fontSize: 29),) ,
                          ),
                        ),
                        onTap: ()async{
                          setState(() {

                            mainImg_uploader();
                            title_deed_uploader();

                            building_type = widget.building_type2;
                            building_sell_rent = widget.sell_rent2;
                            building_city = widget.city2;
                            building_district = widget.district2;
                            building_location_link = widget.location_link2;
                            building_area = widget.area2;
                            building_interface = widget.interface2;
                            building_depth = widget.depth2;
                            building_price = widget.price2;
                            building_price_type = widget.price_type2;
                            building_floors = widget.floors2;
                            building_main_img;
                            building_title_deed;
                            building_description = widget.property_describtion2;
                            building_owner_name  = "owner";
                            building_owner_phone = "888";
                            building_property_state = widget.property_state2;
                            building_client_name = "";
                            building_client_phone = "";
                            Add_data();

                          });

                          // upload post images
                          for (int i = 0; i < widget.images2.length; i++) {
                            String url = await uploadFile(widget.images2[i]);
                            downloadUrls.add(url);
                            print("$url");
                            building_post_images = url;
                            Add_post_img(building_post_images);

                          }
                        } ,


                      )
                    ],
                  )
                ],
              )
          ),
        )
    );
  }



  floors( int number, Icon icona
      ){
    return Container(
      height: other_templates.height(context)/15,
      width: other_templates.width(context)/2.35,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(11))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("طابق",style: TextStyle(fontSize: 30),),
          Text("$number",style: TextStyle(fontSize: 30),),
          icona,
        ],
      ),
    );
  }
}
