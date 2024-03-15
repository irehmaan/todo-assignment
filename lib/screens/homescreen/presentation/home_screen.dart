import 'package:flutter/material.dart';
import 'package:todo/screens/homescreen/widgets/addTodo.dart';
import 'package:todo/screens/homescreen/widgets/animal_list.dart';
import '../../../model/todo_model.dart';
import '../../../services/todo_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final ToDoService _service = ToDoService();
  int page = 1;
  bool isLoading = false;
  List<ToDoModel> todos = [];
  List<ToDoModel> searchedToDo = [];
  bool searchInitiated = false;

  @override
  void initState() {
    super.initState();
    loadToDos();
  }

  Future<void> loadToDos() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      final List<ToDoModel> fetchedTodos = await _service.fetch(page: page);
      setState(() {
        todos.addAll(fetchedTodos);
        searchedToDo.addAll(todos);
        page++;
      });
    } catch (e) {
      print('Error fetching todos: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void queryTodos(String query) {
    setState(() {
      searchInitiated = true;
      searchedToDo = todos.where((todo) {
        final title = todo.title.toLowerCase();
        final searchLower = query.toLowerCase();
        return title.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            const Text("H O M E"),
            const SizedBox(width: 50),
            SizedBox(
              width: 130,
              child: TextFormField(
                controller: searchController,
                onChanged: queryTodos,
                decoration: const InputDecoration(
                  hintText: "Search to do's",
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    searchInitiated = false;
                  });
                  searchController.clear();
                },
                icon: const Icon(Icons.clear_sharp))
          ],
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels >=
              notification.metrics.maxScrollExtent - 200) {
            loadToDos();
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                " T o  - D o 's",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              if (!searchInitiated)
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    height: 500,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade400)),
                    child: ListView(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            final todo = todos[index];
                            return ListTile(
                              leading: Text((index + 1).toString()),
                              title: Text(todo.title),
                              subtitle: Text(todo.completed == null
                                  ? 'N /A'
                                  : todo.completed.toString()),
                            );
                          },
                        ),
                        if (isLoading)
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          )
                      ],
                    ),
                  ),
                ),
              if (searchInitiated)
                Column(
                  children: [
                    buildSearchResults(searchedToDo),
                  ],
                ),
              const AddTodo(),
              const AnimalList()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchResults(List<ToDoModel> toDoModel) {
    return Container(
         decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        children: toDoModel
            .map(
              (todo) => ListTile(
                leading: Text((toDoModel.indexOf(todo) + 1).toString()),
                title: Text(todo.title),
                subtitle: Text(
                    todo.completed == null ? 'N /A' : todo.completed.toString()),
              ),
            )
            .toList(),
      ),
    );
  }
}
