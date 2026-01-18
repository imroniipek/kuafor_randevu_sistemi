class HairDresser{

final String name;

final String surname;

HairDresser({required this.name,required this.surname});

factory HairDresser.getFromDb(Map<String,dynamic> map)
{
  return HairDresser(
      name: map["name"] ?? " " ,
      surname: map["surname"] ?? " ");
}
}
