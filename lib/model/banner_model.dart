// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(
    json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  BannerModel({
    this.id,
    this.title,
    this.image,
    this.productId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
  });

  int id;
  String title;
  String image;
  int productId;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int categoryId;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        productId: json["product_id"] == null ? null : json["product_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryId: json["category_id"] == null ? null : json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "product_id": productId == null ? null : productId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category_id": categoryId == null ? null : categoryId,
      };
}
