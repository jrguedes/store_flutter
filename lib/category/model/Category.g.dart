// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..subcategories = (json['subcategories'] as List)
        ?.map((e) =>
            e == null ? null : Subcategory.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subcategories': instance.subcategories
    };
