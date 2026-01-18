import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Consts
{

  static Color primaryColor= Color(0xFF1E293B);

  static Color backgroundColor=Colors.black87;


  static List<Color> get colors => [
    Color(0xFF00E5FF),
    Color(0xFF1DE9B6),
    Color(0xFF7C4DFF),
    Color(0xFF2979FF),
    Color(0xFF00C853),
    Color(0xFFAA00FF),
    Color(0xFF64FFDA),
    Color(0xFF536DFE),
    Color(0xFF5C6BC0),
    Color(0xFF26A69A),
    Color(0xFFFF7043),
    Color(0xFF66BB6A),
    Color(0xFF29B6F6),
    Color(0xFFFFCA28),
  ];

  static Map<int,String> months={

    1:"Ocak",
    2:"Şubat",
    3:"Mart",
    4:"Nisan",
    5:"Mayıs",
    6:"Haziran",
    7:"Temmuz",
    8:"Ağustos",
    9:"Eylül",
    10:"Ekim",
    11:"Kasım",
    12:"Aralık"
  };

  static Map<String,String> days={

    "Monday":"Pazartesi",
    "Tuesday":"Salı",
    "Wednesday":"Çarşamba",
    "Thursday":"Perşembe",
    "Friday":"Cuma",
    "Saturday": "Cumartesi",
    "Sunday":"Pazar",

  };
  static String converttoDate(DateTime time)
  {
    final month=months[time.month];

    final day=days[DateFormat("EEEE").format(time)];

    return "${time.day} $month $day";

  }

  static double getTheScreenSize(BuildContext context)
  {
    final size=MediaQuery.sizeOf(context).width;

    return size*0.045;
  }

}


