import 'dart:convert';

import 'package:firstgetx/models/profilemodel.dart';
import 'package:firstgetx/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class HomeController extends GetxController{
  Rx<String> counter="".obs;
  late TextEditingController textfieldcontroller;
  final userlist=<Users>[].obs;
  List<Users> get CommodityList => userlist.toList();
  @override
  void onInit() async{
    // TODO: implement onInit
    textfieldcontroller=TextEditingController();
    incrementcounter();
    await getusersdata();
    await getuserprofile("mojombo");
    super.onInit();
  }
  incrementcounter(){
    counter.value="this is the required string";
  }
  Future<void> getusersdata() async{
    var url=Uri.parse("https://api.github.com/users?since=0");
    final response= await http.get(url);
    List<Users> ans= UsersfromJson(response.body);
    userlist.addAll(ans);
    print(ans);
  }
  Future<void> getuserprofile(username) async{
    var url=Uri.parse("https://api.github.com/users/${username}");
    final response= await http.get(url);
    Profile user= Profile.fromJson(jsonDecode(response.body));
    print(user.receivedEventsUrl);
  }
}