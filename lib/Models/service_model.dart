enum Category{Sac,Sakal,Bakim}


class ServiceModel{

  final String id;

  final String name;

  final double price;

  final int duration;

  final Category category;

  ServiceModel({required this.id,required this.name,required this.price,required this.duration,required this.category});

  factory ServiceModel.fromMap(String id,Map<String,dynamic>theMap)
  {
   return ServiceModel(
       id: id,
       name: theMap["name"],
       price: theMap["price"],
       duration: theMap["duration"],
       category: theMap["category"]
   );
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        "name":name,
        "price":price,
        "duration":duration,
        "category":category
      };

  }
}