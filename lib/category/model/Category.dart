import 'package:json_annotation/json_annotation.dart';
import 'package:store_flutter/subcategory/model/Subcategory.dart';

part 'Category.g.dart';

@JsonSerializable()
class Category {
  
  int id;
  String name;
  List<Subcategory> subcategories;

  Category();

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
