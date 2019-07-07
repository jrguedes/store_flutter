import 'package:flutter/material.dart';
import 'package:store_flutter/category/bloc/CategoryBloc.dart';
import 'package:store_flutter/category/model/Category.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryBloc _categoryBloc;
  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    _categoryBloc = new CategoryBloc();
    super.initState();
  }

  @override
  void dispose() {
    _categoryBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jason viadão"),
      ),
      body: StreamBuilder(
        initialData: _categoryBloc.itemsFlux.value,
        stream: _categoryBloc.itemsFlux,
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Category category = snapshot.data[index];
                return Card(
                  elevation: 10,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text("${category.id}"),
                        Text("${category.name}"),
                        Text("JSON É VIADÃO"),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModal();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showModal() {
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Scaffold(
              body: Container(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 15, right: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Nome",
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.5)),
                            ),
                            onSaved:_categoryBloc.nameEvent.add,
                          ),
                        ),
                        OutlineButton(
                          color: Colors.red,
                          child: Center(
                            child: Text("Salvar"),
                          ),
                          onPressed: () {
                            _formKey.currentState.save();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
