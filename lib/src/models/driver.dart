import 'dart:convert';

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));

String driverToJson(Driver data) => json.encode(data.toJson());

class Driver {
  String id;
  String userName;
  String email;
  String phone;
  String password;
  String plate;

  Driver({
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
    required this.plate,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["id"],
    userName: json["userName"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    plate: json["plate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "email": email,
    "phone": phone,
    "plate": plate,
  };
}
