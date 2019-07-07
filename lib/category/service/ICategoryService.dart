import 'package:store_flutter/category/model/Category.dart';
import 'package:store_flutter/category/model/CategoryDto.dart';

abstract class ICategoryService {
  
  Future<List<Category>> findAll();

  Future<void> save(CategoryDto categoryDto);

  Future<void> update(int id,CategoryDto categoryDto);

  Future<void> delete(int id);

}
