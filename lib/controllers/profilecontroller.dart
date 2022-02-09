import 'package:firstgetx/models/profilemodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileController extends GetxController{
 String username=Get.arguments;
 Rx<String> usernameforpage="".obs;
 Rx<String> companyname="".obs;
 Rx<String> blog="".obs;
  @override
  void onInit() async{
    // TODO: implement onInit

    // username= Get.arguments;
    await getuserprofile(username);
    super.onInit();
  }

  Future<void> getuserprofile(username) async{
    var url=Uri.parse("https://api.github.com/users/${username}");
    final response= await http.get(url);
 Profile user= Profile.fromJson(jsonDecode(response.body));
 usernameforpage.value=user.name!;
 companyname.value=user.company!;
 blog.value=user.blog!;
  }
}