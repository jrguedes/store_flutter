import 'package:json_annotation/json_annotation.dart';

part 'Subcategory.g.dart';

// comando pra gerar as classes
// flutter packages pub run build_runner build

@JsonSerializable()
class Subcategory {

  int id;
  String name;

  Subcategory();

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}
