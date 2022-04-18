import 'dart:async';

import 'package:book_crud_api/pages/list_page.dart';
import 'package:book_crud_api/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bluePrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/book_icon.png',
              width: MediaQuery.of(context).size.width - 2 * 80,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Book Management',
              style: txSemiBold.copyWith(color: whiteColor),
            ),
            SizedBox(
              height: 120,
            )
          ],
        ),
      ),
    );
  }
}
