// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.parentId,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  int id;
  String name;
  int parentId;
  int position;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        position: json["position"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "position": position,
        "status": status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
      };
}
