import 'dart:convert';

import 'package:diary/1_home/home_page.dart';
import 'package:diary/2_account/a_sign%20in/creat_account.dart';
import 'package:diary/dataa.dart';
import 'package:flutter/cupertino.dart';
import 'package:diary/2_account/e_account%20details/information%20section/change_account_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../dataa.dart';
import '../../../dataa.dart';
import '../../a_sign in/creat_account.dart';


class account_info extends StatefulWidget {
  //const account_info({Key? key}) : super(key: key);
  final String uname;
  final String uphone;
  account_info({
    required this.uname,
    required this.uphone,
  });


  @override
  State<account_info> createState() => _account_infoState();
}

class _account_infoState extends State<account_info> {
  var litems = ["1","2","Third"];
  var fullname = [];
  var u_phone = [];
  var password = [];
  var usertype = [];
  var x="";
  var y="";

  Future getData() async{
    var url=Uri.parse("http://localhost:4000/s");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);

    print(list1);
    litems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)

    //rangitems.clear();
    // pointitems.clear();
    // cashitems.clear();
    // rangitems.clear();

    for (int i=0; i<list1.length; i++){
      fullname.add(list1[i]["fullname"]);
      u_phone.add(list1[i]["u_phone"]);
      password.add(list1[i]["password"]);
      usertype.add(list1[i]["usertype"]);

      setState(() {

      });
    }
    //print(imitems);//to print in my app
    print(list1);//to print my databace in run

  }
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
        SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 17, 0, 19.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back,
                          size: 23.sp, color: Color(0xFF6C804B),),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Container(
                            height: height() / 3.5,
                            width: width(),
                            margin: EdgeInsets.fromLTRB(0, 0, 37, 15.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(widget.uname, style: TextStyle(fontSize: 27,),
                                      textAlign: TextAlign.right,),
                                    Text(":الاسم ", style: TextStyle(fontSize: 27,),
                                      textAlign: TextAlign.right,),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(widget.uphone,  style: TextStyle(fontSize: 27,),
                                      textAlign: TextAlign.right,),
                                    Text(" :رقم الهاتف ", style: TextStyle(fontSize: 27,),
                                      textAlign: TextAlign.right,),

                                  ],
                                ),



                                /*
                           Text("الاسم: مكتب حجي سلطان ", style: TextStyle(fontSize: 27,), textAlign: TextAlign.right,),
                           Text("رقم الهاتف: 07700000 ", style: TextStyle(fontSize: 27), textAlign: TextAlign.right,),
                           Text("تاريخ انتهاء الاشتراك: ('التاريخ مثلا 2022/11/15' او' لست مشتركا') ", style: TextStyle(fontSize: 27), textAlign: TextAlign.right,),

                            */
                              ],
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("تسجيل الخروج", style: TextStyle(fontSize: 30),),
                        IconButton(
                          icon: Icon(Icons.logout, size: 30, color: Colors.red,),
                          onPressed: () {
                            //Login_state = false;
                            Navigator.of(context).
                            push(MaterialPageRoute(builder: (context) =>
                                creat_account()));
                          },
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      color: Colors.grey,
                      height: height() / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Text("تعديل المعلومات", style: TextStyle(
                              fontSize: 27,), textAlign: TextAlign.right,),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                  builder: (context) => change_account_info()));
                            },
                          ),
                          GestureDetector(
                            child: Text("تغيير كلمة السر", style: TextStyle(
                              fontSize: 27,), textAlign: TextAlign.right,),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                  builder: (context) => change_account_info()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
        )
    );
  }
  height(){
    var height=MediaQuery.of(context).size.height;
    return height;
  }
  width(){
    var width=MediaQuery.of(context).size.width;
    return width;
  }
  Container tr(String x,String t){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text("الاسم: ", style: TextStyle(fontSize: 27,),
                textAlign: TextAlign.right,),
              Text(x, style: TextStyle(fontSize: 27,),
                textAlign: TextAlign.right,)
            ],
          ),
          Row(
            children: [
              Text("رقم الهاتف: ", style: TextStyle(fontSize: 27,),
                textAlign: TextAlign.right,),
              Text(y, style: TextStyle(fontSize: 27,),
                textAlign: TextAlign.right,)
            ],
          ),
        ],
      ),


    );
  }
}