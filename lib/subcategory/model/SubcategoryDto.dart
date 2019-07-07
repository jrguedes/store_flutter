
import 'package:json_annotation/json_annotation.dart';

part 'SubcategoryDto.g.dart';

// comando pra gerar as classes
// flutter packages pub run build_runner build

@JsonSerializable()
class SubcategoryDto {
  String name;

  SubcategoryDto();

  factory SubcategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryDtoToJson(this);
}