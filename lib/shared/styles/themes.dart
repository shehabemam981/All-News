  import 'package:flutter/material.dart';

import 'color.dart';

   class mythemedata{

     static ThemeData lightTheme=ThemeData(


       appBarTheme:AppBarTheme(
         backgroundColor:greenColor,
       ),
       textTheme:TextTheme(
           headline1:TextStyle(
             color: Colors.black,
             fontSize: 22,
             fontWeight: FontWeight.bold
           ),

       ),
       colorScheme:ColorScheme(brightness: Brightness.light,
           primary: greenColor,
           onPrimary:  Colors.white,
           secondary: Colors.white,
           onSecondary: greenColor,
           error: Colors.red,
           onError: Colors.white,
           background: Colors.grey,
           onBackground: Colors.black,
           surface: Colors.white,
           onSurface: Colors.black),
     );
     static ThemeData darktheme=ThemeData(
       appBarTheme:AppBarTheme(
         backgroundColor:greenColor,
       ),
       textTheme:TextTheme(
         headline1:TextStyle(
             color: Colors.white,
             fontSize: 22,
             fontWeight: FontWeight.bold
         ),

       ),
       scaffoldBackgroundColor: Colors.grey,
       colorScheme: ColorScheme(
           brightness: Brightness.dark,
           primary: Colors.white, onPrimary: Colors.black,
           secondary: Colors.white, onSecondary: Colors.black,
           error:Colors.red, onError: Colors.white,
           background: Colors.black,
           onBackground:Colors.black,
           surface: Colors.black,
           onSurface:   Colors.black),


     );

   }