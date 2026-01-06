
import 'package:flutter/material.dart';

import '../../core/consts.dart';
import '../service_model.dart';

extension ServiceExtension on ServiceModel
{

  Icon returnTheIconData()
  {
    switch(category)
    {
      case("Saç"):
        return Icon(Icons.content_cut,size:30,color:Consts.colors[0]);

      case("Sakal"):
        return Icon(Icons.face,size:30,color:Consts.colors[1]);

      case("Bakım"):
        return Icon(Icons.auto_awesome,size:30,color:Consts.colors[2]);

      default:
        return Icon(Icons.person,size:30,color:Consts.colors[3]);
    }

  }
}