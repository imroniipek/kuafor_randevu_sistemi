import 'package:flutter/material.dart';
import '../service_model.dart';

extension ServiceExtension on ServiceModel {

  Icon returnTheIconData() {
    IconData iconData;

    switch (category) {
      case Category.Hair:
        iconData = Icons.content_cut_rounded;
        break;

      case Category.Beard:
        iconData = Icons.face_retouching_natural_rounded;
        break;

      case Category.Care:
        iconData = Icons.auto_awesome_rounded;
        break;

      case Category.Color:
        iconData = Icons.brush_rounded;
        break;

      case Category.Combo:
        iconData = Icons.face_retouching_natural_rounded;
        break;

      case Category.Special:
        iconData = Icons.star_rounded;
        break;
      case Category.Style:
        iconData = Icons.air_rounded;
        break;

    }
    return Icon(iconData, color: color);
  }
}