import 'package:calculator/homeScreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Calculator',
    initialRoute:HomeScreen.routeName ,
    routes: {
  HomeScreen.routeName:(context)=>HomeScreen(),
  },

  ));
}