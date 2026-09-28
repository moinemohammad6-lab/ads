
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/data/models/apis/tode_model.dart';
import 'package:flutter_application_2/core/data/repository/todo_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> result = [];
  late TodoRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = TodoRepository();
  }

  Future<List<TodoModel>?> getTodos() async {
    _repository.getTodos().then((value) {
      value.fold(
        (l) {
          print(l);
        },
        (r) {
          result = r;
        },
      );
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getTodos(),
          builder: (context, data) {
            return data.connectionState == ConnectionState.waiting
                ? CircularProgressIndicator()
                : data.hasError
                ? Text('error')
                : data.data != null && data.hasData
                ? SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: result.length,
                        itemBuilder: (BuildContext context, int i) {
                          return Column(
                            children: [
                              Text(data.data![i].id.toString()),
                              Text(data.data![i].title.toString()),
                              Text(data.data![i].userId.toString()),
                              Text(data.data![i].completed.toString()),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                )
                : Text('No data');
          },
        ),
      ),
    );
  }
}
