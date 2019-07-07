// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) {
  return CategoryDto()
    ..name = json['name'] as String
    ..subcategories = (json['subcategories'] as List)
        ?.map((e) => e == null
            ? null
            : SubcategoryDto.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subcategories': instance.subcategories
    };
