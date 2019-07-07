import 'package:rxdart/rxdart.dart';
import 'package:store_flutter/category/model/Category.dart';
import 'package:store_flutter/category/model/CategoryDto.dart';
import 'package:store_flutter/category/service/CategoryService.dart';
import 'package:store_flutter/category/service/ICategoryService.dart';

class CategoryBloc {
  final ICategoryService _categoryService = new CategoryService();

  final _items = new BehaviorSubject.seeded(<Category>[]);
  ValueObservable<List<Category>> get itemsFlux => _items.stream;
  Sink<List<Category>> get itemsEvent => _items.sink;

  final _name = new BehaviorSubject<String>();
  ValueObservable<String> get nameFlux => _name.stream;
  Sink<String> get nameEvent => _name.sink;

  CategoryBloc() {
    _categoryService.findAll().then(itemsEvent.add);

    _name.listen((e) => save());
  }

  Future<void> save() async {
    try {
      final category = CategoryDto()..name = nameFlux.value;
      await _categoryService.save(category);
      await _categoryService.findAll().then(itemsEvent.add);
    } catch (e) {
      print(e);
    }
  }

  void dispose() {
    _name.close();
    _items.close();
  }
}
