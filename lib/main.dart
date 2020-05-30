import 'package:flutter/material.dart';

import 'screens/first_Screen.dart';
import 'screens/result.dart';
void main()
{
  
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>First(),
    },
    
  ));
}