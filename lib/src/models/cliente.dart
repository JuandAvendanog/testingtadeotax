import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  String id;
  String userName;
  String email;
  String phone;
  String password;

  Client({
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["id"],
    userName: json["userName"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "email": email,
    "phone": phone,
  };
}
