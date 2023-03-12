
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch:Colors.green,
  scaffoldBackgroundColor:Colors.white,
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    type:BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    elevation:30.0,
    selectedItemColor: HexColor('#25D366'),
    unselectedItemColor: Colors.grey,
  ),
  appBarTheme:AppBarTheme(
    iconTheme:IconThemeData(
      color:Colors.black,
      size:25.0,
    ),
    titleTextStyle:TextStyle(
      color: Colors.black,
      fontSize:22.0,
      fontWeight:FontWeight.bold,
    ),
    backgroundColor:Colors.white,
    elevation:0.0,
    backwardsCompatibility:false,
    systemOverlayStyle:SystemUiOverlayStyle(
      statusBarColor:Colors.white,
      statusBarBrightness:Brightness.dark,
      statusBarIconBrightness:Brightness.dark,
    ),
  ),
  textTheme:TextTheme(
    headline6:TextStyle(
      fontWeight:FontWeight.w700,
      fontSize:20.0,
      color:Colors.black,
    ),
  ),
);

ThemeData darkTheme =ThemeData(
  primarySwatch:Colors.green,
  scaffoldBackgroundColor:HexColor('#515a5a'),
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    type:BottomNavigationBarType.fixed,
    backgroundColor:HexColor('#515a5a'),
    elevation:30.0,
    selectedItemColor: HexColor('#25D366'),
    unselectedItemColor: Colors.grey,
  ),
  appBarTheme:AppBarTheme(
    iconTheme:IconThemeData(
      color:Colors.white,
      size:25.0,
    ),
    titleTextStyle:TextStyle(
      color: Colors.white,
      fontSize:22.0,
      fontWeight:FontWeight.bold,
    ),
    backgroundColor:HexColor('#515a5a'),
    elevation:0.0,
    backwardsCompatibility:false,
    systemOverlayStyle:SystemUiOverlayStyle(
      statusBarColor:HexColor('#515a5a'),
      statusBarBrightness:Brightness.light,
      statusBarIconBrightness:Brightness.light,
    ),
  ),
  textTheme:TextTheme(
    headline6:TextStyle(
      fontWeight:FontWeight.w700,
      fontSize:20.0,
      color:Colors.white,
    ),
  ),
);