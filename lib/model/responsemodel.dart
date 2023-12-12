

// import 'dart:convert';

// Response responseFromJson(String str) {
//     final jsonData = json.decode(str);
//     return Response.fromJson(jsonData);
// }

// String? responseToJson(Response data) {
//     final dyn = data.toJson();
//     return json.encode(dyn);
// }

// class Response {
//     User? user;
//     Tokens? tokens;

//     Response({
//         this.user,
//         this.tokens,
//     });

//     factory Response.fromJson(Map<String?, dynamic> json) => new Response(
//         user: User.fromJson(json["user"]),
//         tokens: Tokens.fromJson(json["tokens"]),
//     );

//     Map<String?, dynamic> toJson() => {
//         "user": user?.toJson(),
//         "tokens": tokens?.toJson(),
//     };
// }

// class Tokens {
//     String? accessToken;
//     String? refreshToken;
//     int? expiresIn;

//     Tokens({
//         this.accessToken,
//         this.refreshToken,
//         this.expiresIn,
//     });

//     factory Tokens.fromJson(Map<String?, dynamic> json) => new Tokens(
//         accessToken: json["access_token"],
//         refreshToken: json["refresh_token"],
//         expiresIn: json["expiresIn"],
//     );

//     Map<String?, dynamic> toJson() => {
//         "access_token": accessToken,
//         "refresh_token": refreshToken,
//         "expiresIn": expiresIn,
//     };
// }
class Token {
  String? refreshToken;
  String? accessToken;

  Token({
    this.accessToken,
    this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refreshToken: json['refresh_token'],
        accessToken: json['access_token'],
      );
}


// class User {
//     String? id;
//     String? username;
//     String? firstName;
//     String? middleName;
//     String? lastName;
//     dynamic image;
//     String? onlineStatus;
//     String? email;
//     bool? verified;
//     String? role;
//     String? createdAt;
//     String? updatedAt;
//     dynamic subServiceId;
//     dynamic sewaServiceId;

//     User({
//         this.id,
//         this.username,
//         this.firstName,
//         this.middleName,
//         this.lastName,
//         this.image,
//         this.onlineStatus,
//         this.email,
//         this.verified,
//         this.role,
//         this.createdAt,
//         this.updatedAt,
//         this.subServiceId,
//         this.sewaServiceId,
//     });

//     factory User.fromJson(Map<String?, dynamic> json) => new User(
//         id: json["id"],
//         username: json["username"],
//         firstName: json["first_name"],
//         middleName: json["middle_name"],
//         lastName: json["last_name"],
//         image: json["image"],
//         onlineStatus: json["onlineStatus"],
//         email: json["email"],
//         verified: json["verified"],
//         role: json["role"],
//         createdAt: json["createdAt"],
//         updatedAt: json["updatedAt"],
//         subServiceId: json["subServiceId"],
//         sewaServiceId: json["sewaServiceId"],
//     );

//     Map<String?, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//         "first_name": firstName,
//         "middle_name": middleName,
//         "last_name": lastName,
//         "image": image,
//         "onlineStatus": onlineStatus,
//         "email": email,
//         "verified": verified,
//         "role": role,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "subServiceId": subServiceId,
//         "sewaServiceId": sewaServiceId,
//     };
// }
