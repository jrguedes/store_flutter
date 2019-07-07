import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:store_flutter/category/model/Category.dart';
import 'package:store_flutter/category/model/CategoryDto.dart';
import 'package:store_flutter/category/service/ICategoryService.dart';

class CategoryService implements ICategoryService {
  
  final String baseUrl = "https://980b1089.ngrok.io";

  final Dio dio = new Dio();

  @override
  Future<List<Category>> findAll() async {
    try {
      final Response response = await dio.get("$baseUrl/v1/api/categories");

      List<Map<String, dynamic>> items =
          (response.data as List)
          .cast<Map<String,dynamic>>();

      final List<Category> categories =
          items
          .map<Category>((e) => Category.fromJson(e))
          .toList();

      return categories;
    } on DioError catch (e) {
      print(e.message);
      print(e.response.data);
      rethrow;
    } catch (e) {
      print(e.message);
      rethrow;
    }
  }

  @override
  Future<void> save(CategoryDto categoryDto) async {
    try {
      String json = jsonEncode(categoryDto);

      await dio.post("$baseUrl/v1/api/categories", data: json);
    } on DioError catch (e) {
      print(e.message);
      print(e.response.data);
      rethrow;
    } catch (e) {
      print(e.message);
      rethrow;
    }
  }

  @override
  Future<void> update(int id, CategoryDto categoryDto) async {
    try {
      String json = jsonEncode(categoryDto);

      await dio.patch("$baseUrl/v1/api/categories/$id", data: json);
    } on DioError catch (e) {
      print(e.message);
      print(e.response.data);
      rethrow;
    } catch (e) {
      print(e.message);
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await dio.delete("$baseUrl/v1/api/categories/$id");
    } on DioError catch (e) {
      print(e.message);
      print(e.response.data);
      rethrow;
    } catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
