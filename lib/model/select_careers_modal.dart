import 'dart:convert';

List<Selectcareers> selectcareersFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Selectcareers>.from(
      jsonData.map((x) => Selectcareers.fromJson(x)));
}

String selectcareersToJson(List<Selectcareers> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Selectcareers {
  String? id;
  String? title;
  String? status;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<SubService>? subServices;
  Forum? forum;

  Selectcareers({
    this.id,
    this.title,
    this.status,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.subServices,
    this.forum,
  });

  factory Selectcareers.fromJson(Map<String, dynamic> json) => Selectcareers(
        id: json["id"],
        title: json["title"],
        status: json["status"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        subServices: List<SubService>.from(
            json["subServices"].map((x) => SubService.fromJson(x))),
        forum: json["forum"] == null ? null : Forum.fromJson(json["forum"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "subServices": List<dynamic>.from(subServices!.map((x) => x.toJson())),
        "forum": forum == null ? null : forum!.toJson(),
      };
}

class Forum {
  String? id;
  String? title;
  dynamic image;
  String? sewaServiceId;
  String? createdAt;
  String? updatedAt;

  Forum({
    this.id,
    this.title,
    this.image,
    this.sewaServiceId,
    this.createdAt,
    this.updatedAt,
  });

  factory Forum.fromJson(Map<String, dynamic> json) => Forum(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        sewaServiceId: json["sewaServiceId"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "sewaService_id": sewaServiceId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class SubService {
  String? id;
  String? sewaServiceId;
  String? title;
  String? description;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? subserviceHasSyllabus;

  SubService({
    this.id,
    this.sewaServiceId,
    this.title,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.subserviceHasSyllabus,
  });

  factory SubService.fromJson(Map<String, dynamic> json) => SubService(
        id: json["id"],
        sewaServiceId: json["sewaService_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        subserviceHasSyllabus:
            List<dynamic>.from(json["subserviceHasSyllabus"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sewaService_id": sewaServiceId,
        "title": title,
        "description": description,
        "image": image,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "subserviceHasSyllabus":
            List<dynamic>.from(subserviceHasSyllabus!.map((x) => x)),
      };
}
