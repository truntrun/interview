
import 'package:firstgetx/controllers/homecontroller.dart';
import 'package:firstgetx/views/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/navigatetothis.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  int _counter = 0;
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
   final _controller=Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Column(
         children: [
           const SizedBox(height: 40,),
           Container(
             width: width,
             height: height!*0.01,
             decoration: const BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(10))
             ),
             child: TextField(
               controller: _controller.textfieldcontroller,
             ),
           ),
           Container(
             width: width,
             height: height!*0.8,
             padding: EdgeInsets.all(10),
             child: Obx((){

              if(_controller.userlist.length>0) {
                return ListView.builder(
                  itemCount: _controller.userlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(ProfilePage(),arguments: _controller.userlist.elementAt(index).login);
                      },
                      child: ListTile(
                        leading: Container(
                          width: 60,
                          height: 50,
                          child: Image.network(
                              _controller.userlist.elementAt(index).avatarUrl!),
                        ),
                        trailing: Text(
                          _controller.userlist.elementAt(index).login!,
                          style: const TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        title: Text(_controller.userlist.elementAt(index).login!),
                        subtitle:
                            Text(_controller.userlist.elementAt(index).url!),
                      ),
                    );
                  });
              } else {
                return
                    const Center(
                      child: CircularProgressIndicator(),
                    );
              }
            }),
           ),
         ],
        ),
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
