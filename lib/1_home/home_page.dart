import 'package:diary/2_account/b_login/login.dart';
//import 'package:diary/dataa.dart';
import 'package:flutter/material.dart';

// import packages
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:responsive_sizer/responsive_sizer.dart';

//import dart files
import 'package:diary/templates/other_templates.dart';
import 'package:diary/1_home/Carousel.dart';
import '../2_account/e_account details/information section/account_info.dart';
import '../dataa.dart';
import '../templates/post_templates.dart';
import '../4_filter/filter.dart';

class home_page extends StatefulWidget {
  // const home_page({Key? key}) : super(key: key);

  final String uname;
  final String uphone;
  home_page({
    required this.uname,
    required this.uphone,
  });

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {


  post_templates _post_templates = post_templates();
  //var litems = ["rr","rrr"];
  var building_iditems=[];
  var building_typeitems=[];
  var building_sell_rentitems = [];
  var building_cityitems = [];
  var building_districtitems = [];
  var building_location_linkitems = [];
  var building_areaitems = [];
  var building_interfaceitems=[];
  var building_depthitems=[];
  var building_priceitems = [];
  var building_price_typeitems = [];
  var building_floorsitems = [];
  var building_main_imgitems=[];
  var building_title_deeditems=[];
  var building_descriptionitems=[];
  var owner_nameitems=[];
  var owner_phoneitems=[];
  var building_property_stateitems=[];
  var signin_iditems=[];
  var client_nameitems=[];
  var client_phoneitems=[];
  var imgListitems=['https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
      'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
    //'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
  ];

  //var for land
  //var litems = ["rr","rrr"];
  var land_iditems =[];
  var land_typeitems=[];
  var land_cityitems = [];
  var land_districtitems = [];
  var land_location_linkitems = [];
  var land_areaitems = [];
  var land_area_typeitems = [];
  var land_interfaceitems=[];
  var land_depthitems=[];
  var land_priceitems = [];
  var land_price_typeitems = [];
  var land_main_imgitems = [];
  var land_title_deeditems=[];
  var land_descriptionitems=[];
  var owner_lnameitems=[];
  var owner_lphoneitems=[];
  var property_lstateitems=[];
  var client_lnameitems=[];
  var client_lphoneitems=[];

  //var for stor
  var store_iditems =[];
  var store_sell_rentitems=[];
  var store_cityitems = [];
  var store_districtitems = [];
  var stor_location_linkitems = [];
  var stor_areaitems = [];
  var stor_interfaceitems=[];
  var stor_depthitems=[];
  var stor_priceitems = [];
  var stor_price_typeitems = [];
  var stor_main_imgitems = [];
  var stor_title_deeditems=[];
  var stor_descriptionitems=[];
  var owner_snameitems=[];
  var owner_sphoneitems=[];
  var property_sstateitems=[];
  var client_snameitems=[];
  var client_sphoneitems=[];

//var for residential
  var residential_iditems =[];
  var residential_typeitems=[];
  var residential_sell_rentitems=[];
  var residential_cityitems = [];
  var residential_districtitems = [];
  var residential_location_linkitems = [];
  var residential_areaitems = [];
  var residential_interfaceitems=[];
  var residential_depthitems=[];
  var residential_priceitems = [];
  var residential_price_typeitems = [];
  var residential_roomitems = [];
  var residential_hallitems=[];
  var residential_kitchenitems=[];
  var residential_bathroomitems=[];
  var residential_gardenitems=[];
  var residential_carageitems =[];
  var residential_main_imgitems=[];
  var residential_title_deeditems=[];
  var residential_descriptionitems=[];
  var owner_rnameitems=[];
  var owner_rphoneitems=[];
  var property_rstateitems=[];
  var client_rnameitems=[];
  var client_rphoneitems=[];


  Future getData() async{
    var url=Uri.parse("http://dnascholarship.ae/show/b");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    //List<dynamic> list2=json.decode(body);

    print(list1);
    //litems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)
    //items.clear();
    for (int i=0; i<list1.length; i++){
      //litems.add(list1[i]["sale_or_rent"]);
      building_iditems.add("building_id");
      building_typeitems.add(list1[i]["building_type"]);
      building_sell_rentitems.add(list1[i]["building_sell_rent"]);
      building_cityitems.add(list1[i]["building_city"]);
      building_districtitems.add(list1[i]["building_district"]);
      building_location_linkitems.add(list1[i]["building_location_link"]);
      building_areaitems.add(list1[i]["building_area"]);
      building_interfaceitems.add(list1[i]["building_interface"]);
      building_depthitems.add(list1[i]["building_depth"]);
      building_priceitems.add(list1[i]["building_price"]);
      building_price_typeitems.add(list1[i]["building_price_type"]);
      building_floorsitems.add(list1[i]["building_floors"]);
      building_main_imgitems.add(list1[i]["building_main_img"]);
      building_title_deeditems.add(list1[i]["building_title_deed"]);
      building_descriptionitems.add(list1[i]["building_description"]);
      owner_nameitems.add(list1[i]["owner_name"]);
      owner_phoneitems.add(list1[i]["owner_phone"]);
      building_property_stateitems.add(list1[i]["property_state"]);
      signin_iditems.add(list1[i]["signin_id"]);
      client_nameitems.add(list1[i]["client_name"]);
      client_phoneitems.add(list1[i]["client_phone"]);

      setState(() {

      });
    }

    print(list1);//to print my databace in run

  }
  Future getDataland() async{
    var url=Uri.parse("http://dnascholarship.ae/show/l");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    //List<dynamic> list2=json.decode(body);

    print(list1);
    //litems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)
    //items.clear();
    for (int i=0; i<list1.length; i++){
      //litems.add(list1[i]["sale_or_rent"]);
      land_iditems.add(list1[i]["land_id"]);
      land_typeitems.add(list1[i]["land_type"]);
      land_cityitems.add(list1[i]["land_city"]);
      land_districtitems.add(list1[i]["land_district"]);
      land_location_linkitems.add(list1[i]["land_location_link"]);
      land_areaitems.add(list1[i]["land_area"]);
      land_area_typeitems.add(list1[i]["land_area_type"]);
      land_interfaceitems.add(list1[i]["land_interface"]);
      land_depthitems.add(list1[i]["land_depth"]);
      land_priceitems.add(list1[i]["land_price"]);
      land_price_typeitems.add(list1[i]["land_price_type"]);
      land_main_imgitems.add(list1[i]["land_main_img"]);
      land_title_deeditems.add(list1[i]["land_title_deed"]);
      land_descriptionitems.add(list1[i]["land_description"]);
      owner_lnameitems.add(list1[i]["owner_name"]);
      owner_lphoneitems.add(list1[i]["owner_phone"]);
      property_lstateitems.add(list1[i]["property_state"]);
      client_lnameitems.add(list1[i]["client_name"]);
      client_lphoneitems.add(list1[i]["client_phone"]);

      setState(() {

      });
    }

    print(list1);//to print my databace in run

  }
  Future getDatastor() async{
    var url=Uri.parse("http://dnascholarship.ae/show/s");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    //List<dynamic> list2=json.decode(body);

    print(list1);
    //litems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)
    //items.clear();
    for (int i=0; i<list1.length; i++){
      //litems.add(list1[i]["sale_or_rent"]);
      store_iditems.add(list1[i]["store_id"]);
      store_sell_rentitems.add(list1[i]["store_sell_rent"]);
      store_cityitems.add(list1[i]["store_city"]);
      store_districtitems.add(list1[i]["store_district"]);
      stor_location_linkitems.add(list1[i]["store_location_link"]);
      stor_areaitems.add(list1[i]["store_area"]);
      stor_interfaceitems.add(list1[i]["store_interface"]);
      stor_depthitems.add(list1[i]["store_depth"]);
      stor_priceitems.add(list1[i]["store_price"]);
      stor_price_typeitems.add(list1[i]["store_price_type"]);
      stor_main_imgitems.add(list1[i]["store_main_img"]);
      stor_title_deeditems.add(list1[i]["store_title_deed"]);
      stor_descriptionitems.add(list1[i]["store_description"]);
      owner_snameitems.add(list1[i]["owner_name"]);
      owner_sphoneitems.add(list1[i]["owner_phone"]);
      property_sstateitems.add(list1[i]["property_state"]);
      client_snameitems.add(list1[i]["client_name"]);
      client_sphoneitems.add(list1[i]["client_phone"]);

      setState(() {

      });
    }

    print(list1);//to print my databace in run

  }
  Future getDataresidential() async{
    var url=Uri.parse("http://dnascholarship.ae/show/r");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    //List<dynamic> list2=json.decode(body);

    print(list1);
    //litems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)
    //items.clear();
    for (int i=0; i<list1.length; i++){
      residential_iditems.add(list1[i]["residential_id"]);
      residential_typeitems.add(list1[i]["residential_type"]);
      residential_sell_rentitems.add(list1[i]["residential_sell_rent"]);
      residential_cityitems.add(list1[i]["residential_city"]);
      residential_districtitems.add(list1[i]["residential_district"]);
      residential_location_linkitems.add(list1[i]["residential_location_link"]);
      residential_areaitems.add(list1[i]["residential_area"]);
      residential_interfaceitems.add(list1[i]["residential_interface"]);
      residential_depthitems.add(list1[i]["residential_depth"]);
      residential_priceitems.add(list1[i]["residential_price"]);
      residential_price_typeitems.add(list1[i]["residential_price_type"]);
      residential_roomitems.add(list1[i]["residential_room"]);
      residential_hallitems.add(list1[i]["residential_hall"]);
      residential_kitchenitems.add(list1[i]["residential_kitchen"]);
      residential_bathroomitems.add(list1[i]["residential_bathroom"]);
      residential_gardenitems.add(list1[i]["residential_garden"]);
      residential_carageitems.add(list1[i]["residential_carage"]);
      residential_main_imgitems.add(list1[i]["residential_main_img"]);
      residential_title_deeditems.add(list1[i]["residential_title_deed"]);
      residential_descriptionitems.add(list1[i]["residential_description"]);
      owner_rnameitems.add(list1[i]["owner_name"]);
      owner_rphoneitems.add(list1[i]["owner_phone"]);
      property_rstateitems.add(list1[i]["property_state"]);
      client_rnameitems.add(list1[i]["client_name"]);
      client_rphoneitems.add(list1[i]["client_phone"]);

      setState(() {

      });
    }

    print(list1);//to print my databace in run

  }
  void initState(){
    super.initState();
    getData();
    getDataland();
    getDatastor();
    getDataresidential();
  }
  @override

  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
          'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
          'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
    ];
    return Scaffold(

        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xA3B8B8B9),
                      Color(0xA3B8B8B9),
                    ]
                )
            ),

            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          IconButton(
                            icon: Icon(Icons.account_circle_outlined,size: 43,color: main_color1, ),
                            onPressed: (){
                              Navigator.of(context).
                              push(MaterialPageRoute(builder: (context) =>
                              Login_state
                                  ? account_info(uname: "فدشي", uphone: "هلو")
                                  : login(),));
                            },
                          ),

                          IconButton(
                            icon: Icon(CupertinoIcons.line_horizontal_3_decrease,size: 39, color: main_color1,),
                            onPressed: (){

                            },
                          ),
                        ],
                      )
                  ),

                  CarouselWithDotsPage(imgList: imgList),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 11, 23, 11),
                        child: Text(
                          "المعروض",
                          style: TextStyle(
                            color: main_color1,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height / 17,),

                  Container(
                    height: 100.h,
                    width: 100.w,
                    child: ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: building_iditems.length+residential_iditems.length+store_iditems.length+land_iditems.length,
                        itemBuilder: (BuildContext context, int index){
                          return           post_templates.main_post(context,
                              "residential",
                              residential_main_imgitems[index],
                              residential_typeitems[index],
                              residential_sell_rentitems[index],
                              residential_cityitems[index],
                              residential_districtitems[index],
                              residential_location_linkitems[index],
                              residential_areaitems[index],
                              residential_interfaceitems[index],
                              residential_depthitems[index],
                              residential_priceitems[index],
                              residential_price_typeitems[index],
                              residential_roomitems[index],
                              residential_hallitems[index],
                              residential_kitchenitems[index],
                              residential_bathroomitems[index],
                              residential_gardenitems[index],
                              residential_carageitems[index],
                              owner_rnameitems[index],
                              owner_rphoneitems[index],
                              residential_descriptionitems[index],
                              property_rstateitems[index],
                              residential_title_deeditems[index],

                              stor_main_imgitems[index],
                              store_sell_rentitems[index],
                              store_cityitems[index],
                              store_districtitems[index],
                              stor_location_linkitems[index],
                              stor_areaitems[index],
                              stor_interfaceitems[index],
                              stor_depthitems[index],
                              stor_priceitems[index],
                              stor_price_typeitems[index],
                              owner_snameitems[index],
                              owner_sphoneitems[index],
                              store_districtitems[index],
                              property_sstateitems[index],
                              stor_title_deeditems[index],

                              land_main_imgitems[index],
                              land_typeitems[index],
                              land_cityitems[index],
                              land_districtitems[index],
                              land_location_linkitems[index],
                              land_areaitems[index],
                              land_area_typeitems[index],
                              land_interfaceitems[index],
                              land_depthitems[index],
                              land_priceitems[index],
                              land_price_typeitems[index],
                              owner_lnameitems[index],
                              owner_lphoneitems[index],
                              land_districtitems[index],
                              property_lstateitems[index],
                              land_title_deeditems[index],

                              building_main_img[index],
                              building_typeitems[index],
                              building_sell_rentitems[index],
                              building_cityitems[index],
                              building_districtitems[index],
                              building_location_linkitems[index],
                              building_areaitems[index],
                              building_interfaceitems[index],
                              building_depthitems[index],
                              building_priceitems[index],
                              building_price_typeitems[index],
                              building_floorsitems[index],
                              owner_nameitems[index],
                              owner_phoneitems[index],
                              building_descriptionitems[index],
                              building_property_state[index],
                              building_title_deed[index]
                          );
                        } ),
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}
