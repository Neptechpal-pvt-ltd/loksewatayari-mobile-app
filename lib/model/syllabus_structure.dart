// To parse this JSON data, do
//
//     final syllabusStructure = syllabusStructureFromJson(jsonString);

import 'dart:convert';

List<SyllabusStructure> syllabusStructureFromJson(String str) => List<SyllabusStructure>.from(json.decode(str).map((x) => SyllabusStructure.fromJson(x)));

String syllabusStructureToJson(List<SyllabusStructure> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SyllabusStructure {
    String id;
    String title;
    String description;
    String image;
    List<SyllabusSubStructure> syllabusSubStructures;

    SyllabusStructure({
        required this.id,
        required this.title,
        required this.description,
        required this.image,
        required this.syllabusSubStructures,
    });

    factory SyllabusStructure.fromJson(Map<String, dynamic> json) => SyllabusStructure(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        syllabusSubStructures: List<SyllabusSubStructure>.from(json["syllabusSubStructures"].map((x) => SyllabusSubStructure.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "syllabusSubStructures": List<dynamic>.from(syllabusSubStructures.map((x) => x.toJson())),
    };
}

class SyllabusSubStructure {
    String id;
    String syllabusStructureId;
    String title;
    dynamic description;
    String image;
    List<dynamic> subStrTopics;

    SyllabusSubStructure({
        required this.id,
        required this.syllabusStructureId,
        required this.title,
        required this.description,
        required this.image,
        required this.subStrTopics,
    });

    factory SyllabusSubStructure.fromJson(Map<String, dynamic> json) => SyllabusSubStructure(
        id: json["id"],
        syllabusStructureId: json["syllabus_structure_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        subStrTopics: List<dynamic>.from(json["subStrTopics"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "syllabus_structure_id": syllabusStructureId,
        "title": title,
        "description": description,
        "image": image,
        "subStrTopics": List<dynamic>.from(subStrTopics.map((x) => x)),
    };
}
