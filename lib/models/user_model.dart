class UserModel {
  String id;
  String name;
  String lastname;
  int age;
  bool isPeruvian;

  UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.age,
    required this.isPeruvian,
  });

  // TRANSFORMAR EL MAPA DE FIRESTORE EN UN OBJETO USERMODEL
  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      name: map["name"],
      lastname: map["lastname"],
      age: map["age"],
      isPeruvian: map["isPeruvian"],
    );
  }

  // CONERTIR UN OBJETO USERMODEL EN UN MAPA PARA FIRESTORE
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "lastname": lastname,
      "age": age,
      "isPeruvian": isPeruvian,
    };
  }
}
