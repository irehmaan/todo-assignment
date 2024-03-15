import 'package:dio/dio.dart';
import 'package:todo/model/todo_model.dart';

class ToDoService {
  final Dio _dio = Dio();

  final String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<ToDoModel>> fetch({int page = 1, int limit = 50}) async {
    try {
      final response = await _dio.get(url, queryParameters: {
        "_page": page,
        '_limit': limit,
      });

      print(response.data);

      List<dynamic> todo = response.data;

      List<ToDoModel> toDos = todo.map((e) => ToDoModel.fromMap(e)).toList();

      return toDos;
    } catch (e) {
      print("Err $e");
      return [];
    }
  }

  // Future<List<ToDoModel>> search(String query) async {
  //   try {
  //     final searchResult = await _dio.get(url, queryParameters: {
  //       ""
  //     });
  //   } catch (e) {}
  // }
}

// void main() {
//   ToDoService toDoService = ToDoService();
//   var response = toDoService.fetch();
//   print(response);
// }
