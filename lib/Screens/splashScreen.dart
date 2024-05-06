

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';
import '../constants/images.dart';
import '../provider/mainprovider.dart';
import 'home_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    print("codee id her");

    Timer? _timer;


    super.initState();

    MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);



    Timer(const Duration(seconds: 3), () {
      mainProvider.getdetails();
     callNext(context, const HomeScreen());
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(splashimg)),

    );
  }
}
