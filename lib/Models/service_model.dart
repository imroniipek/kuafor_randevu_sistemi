import 'dart:ui';
import 'dart:math';
import '../core/consts.dart';
enum Category { Hair, Beard, Care }
class ServiceModel {
  final String id;
  final String name;
  final double price;
  final int duration;
  final Category category;
  Color color;

  ServiceModel({required this.id, required this.name, required this.price, required this.duration, required this.category})
      :color = Consts.colors[Random().nextInt(Consts.colors.length)];

  factory ServiceModel.fromMap(String id, Map<String, dynamic> map)
  {
    return ServiceModel(
      id: id,
      name: map["name"],
      price: (map["price"] as num).toDouble(),
      duration: map["duration"],
      category: Category.values.firstWhere((e) => e.name == map["category"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "duration": duration,
      "category": category.name,
    };
  }
}
