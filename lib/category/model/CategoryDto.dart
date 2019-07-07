

import 'package:json_annotation/json_annotation.dart';
import 'package:store_flutter/subcategory/model/SubcategoryDto.dart';

part 'CategoryDto.g.dart';

@JsonSerializable()
class CategoryDto {
  
  String name;
  List<SubcategoryDto> subcategories = <SubcategoryDto>[];

  CategoryDto();

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
