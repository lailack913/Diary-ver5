import 'package:diary/2_account/c_restoration/restor_PN.dart';
import 'package:diary/2_account/e_account%20details/information%20section/account_info.dart';
import 'package:diary/dataa.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../../1_home/home_page.dart';
import '../a_sign in/creat_account.dart';
import 'package:diary/templates/other_templates.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


var phoneController = TextEditingController();
var passController = TextEditingController();
var nameController = TextEditingController();

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool check = false;
  var litems = [];

  Future getData() async {
    var url = Uri.parse("http://localhost:4000/s");
    Response response = await get(url);
    String body = response.body;

    List<dynamic> list1 = json.decode(body);
    print(list1);
    litems.clear();
    for (int i=0; i<list1.length; i++) {
      // litems.add(list1[i]["fullname"]);
      litems.add(list1[i]["u_phone"]);
      // litems.add(list1[i]["password"]);
      //litems.add(list1[i]["usertype"]);

      setState(() {
        // if the name in mySql == name you inter
        if(list1[i]["u_phone"] == u_phone){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => account_info(uname:fullname,uphone: u_phone)));
        }

        else
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => creat_account()));

      });


    }

    // print(litems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 55, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                        size: 23.sp, color: main_color,),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 3.h,),

                    Text(
                      "تسجيل الدخول",
                      style: TextStyle(color: Diary_font_color,
                        fontSize: 31,
                      ),
                    ),
                    Text(
                      "اهلا بعودتك",
                      style: TextStyle( color: Diary_font_color,
                        fontSize: 31,
                      ),
                    ),

                    SizedBox(height: 2.h,),
                    TextField(
                      controller: nameController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        labelText: 'الاسم',
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: phoneController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        labelText: 'رقم الهاتف',
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: passController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Text(
                            "هل نسيت كلمة السر؟",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: main_color),
                          ),
                          onTap:(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> restor_pn(title: 'استعادة الحساب', message: 'سيتم ارسال رمز تاكيد لرقم هاتفك ', note: '',)));
                          },
                        ),

                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 6.h, width: 20.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF6C804B)
                                ),
                                onPressed: () {
                                  setState(() {
                                    fullname=nameController.text;
                                    u_phone = phoneController.text;
                                    password = passController.text;
                                  });
                                  getData();

                                  // Login_state=true;
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => account_info(uname:fullname,uphone:u_phone)));


                                },
                                child: Text("تسجيل الدخول", style: TextStyle(fontSize: 17.sp),),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "ليس لديك حساب؟",
                              style: TextStyle(fontSize: 19),
                            ),
                            GestureDetector(
                              child: Text(
                                "انشاء حساب",
                                style: TextStyle(
                                    fontSize: 19,
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF6C804B)),
                              ),
                              onTap: (){

                                Navigator.of(context).
                                push(MaterialPageRoute(builder: (context) => creat_account()));
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}