import 'dart:convert';

import 'package:diary/2_account/a_sign%20in/creat_account.dart';
import 'package:diary/2_account/e_account%20details/information%20section/account_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../dataa.dart';

var phoneController=TextEditingController();
var nameController=TextEditingController();
class change_account_info extends StatefulWidget {
  const change_account_info({Key? key}) : super(key: key);

  @override
  State<change_account_info> createState() => _change_account_infoState();
}

class _change_account_infoState extends State<change_account_info> {
  bool check = false;
  Future Update_data() async {
    var url = Uri.parse("http://localhost:4000/r");
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"fullname": "$fullname",'
        ' "u_phone": "$u_phone",'
        ' "password": "$passwordup",'
        ' "usertype": "$usertypeup"}';
    // make POST request
    Response response = await put(url, headers: headers, body: json);
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
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),

      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: height()/3,
              width: width()/1.2,
              margin: EdgeInsets.only(bottom:  height()/4),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: nameController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'الاسم',
                      hintText:  'الاسم قبل التغيير: مكتب حجي سلطان',
                      labelStyle: TextStyle( ),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  TextField(
                    controller: phoneController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف ',
                      hintText:  'رقم الهاتف قبل التغيير: 07700000 ',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              )
          ),
          Container(
            color: Colors.grey,
            height: height()/10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Text("احفظ التعديل", style: TextStyle(fontSize: 27,), textAlign: TextAlign.right,),
                  onTap: (){
                    setState(() {
                      fullname=nameController.text;
                      u_phone=phoneController.text;
                      Update_data();
                    });

                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => account_info(uname: fullname, uphone: u_phone)));

                  },

                ),
              ],
            ),
          ),
        ],
      ),
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
}
