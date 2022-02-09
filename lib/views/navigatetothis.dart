
import 'package:flutter/material.dart';
class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("hello there user!.")
        ),
      ),
    );
  }
}
