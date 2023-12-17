

import 'dart:convert';

UsersData usersDataFromJson(String str) {
    final jsonData = json.decode(str);
    return UsersData.fromJson(jsonData);
}

String usersDataToJson(UsersData data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class UsersData {
    String? username;
    String? firstName;
    String? middleName;
    String? lastName;
    String? password;
    String? email;

    UsersData({
        this.username,
        this.firstName,
        this.middleName,
        this.lastName,
        this.password,
        this.email,
    });

    factory UsersData.fromJson(Map<String, dynamic> json) => new UsersData(
        username: json["username"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        password: json["password"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "password": password,
        "email": email,
    };
}
