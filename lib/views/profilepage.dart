import 'package:firstgetx/controllers/homecontroller.dart';
import 'package:firstgetx/controllers/profilecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfilePage extends StatelessWidget {
  // const ProfilePage({Key? key}) : super(key: key);
 double? height;
 double? width;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    final _controller= Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        title: Text(_controller.username!),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                width: width!*0.9,
                height: height!*0.3,
                color: Colors.red,
                margin: EdgeInsets.only(left: 10,right: 10),
              ),
              Container(
                width: width,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Followers : 121"),
                    Text("Following: 231")
                  ],
                ),
              ),
              Container(
                width: width,
                height: height!*0.25,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                margin: EdgeInsets.only(left: 10,right: 10),
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Obx((){
                      if(_controller.usernameforpage.value!="")
                        return Text("Name : ${_controller.usernameforpage.value}");
                    else
                      return Text("Waiting for username");
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Obx((){
                      if(_controller.usernameforpage.value!="")
                        return Text("Company: ${_controller.companyname.value}");
                    else
                      return Text("Waiting for companyname");
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Obx((){
                      if(_controller.blog.value!="")
                        return Text("Blog: ${_controller.blog.value}");
                    else
                      return Text("Waiting for blog");
                    }),
                    SizedBox(
                      height: 50,
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  width: width,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Notes :")),
              Container(
                width: width,
                height: height!*0.25,
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black),
                ),
                
              ),
              Container(
                width: width,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    print("Savepressed");
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                    child: Text("Save"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
