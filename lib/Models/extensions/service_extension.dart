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
        iconData = Icons.face_retouching_natural;
        break;
      case Category.Care:
        iconData = Icons.clean_hands_rounded;
        break;
    }
    return Icon(iconData, size: 35, color: color);
  }
}