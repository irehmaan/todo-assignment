import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/model/todo_model.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController todoTitleController = TextEditingController();
  List<ToDoModel> todoList = [];
  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final todoBox = await Hive.openBox<ToDoModel>('todos');

    setState(() {
      todoList = todoBox.values.toList();
    });
  }

  Future<void> _submitTodo() async {
    final todoBox = await Hive.openBox<ToDoModel>('todos');
    final newTodo = ToDoModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: todoTitleController.text,
      completed: false,
    );
    await todoBox.add(newTodo);
    todoTitleController.clear();
    setState(() {
      todoList.add(newTodo);
    });
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Todo "${newTodo.title}" added successfully'),
      ),
    );
  }

  Future<void> _toggleTodoStatus(int index) async {
    final todoBox = await Hive.openBox<ToDoModel>('todos');
    final updatedTodo = todoList[index];
    updatedTodo.completed = !updatedTodo.completed!; // Toggle the status
    await todoBox.putAt(index, updatedTodo);
    setState(() {
      todoList[index] = updatedTodo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              Text(
                " Add To-do ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
          TextField(
            controller: todoTitleController,
            decoration: const InputDecoration(
              labelText: 'TODO Title',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitTodo,
            child: const Text('Save'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300)),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  final todo = todoList[index];
                  return ListTile(
                    title: Text(todoList[index].title),
                    subtitle: Text(
                        'Status: ${todo.completed! ? 'Completed' : 'Incomplete'}'),
                    trailing: IconButton(
                      onPressed: () => _toggleTodoStatus(index),
                      icon: Icon(todo.completed! ? Icons.check : Icons.cancel),
                      color: todo.completed! ? Colors.green : Colors.red,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
