import 'package:flutter/material.dart';
import 'package:todoapp/models/todo_models.dart';
import 'package:todoapp/widgets/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModels> todos = [];
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TODO LIST"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        todos[index].check =
                            !todos[index].check; // Toggling the 'done' status
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Todo(
                            title: todos[index].title,
                            description: todos[index].description,
                            done: todos[index].check,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              todos.removeAt(index);
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: title,
                      decoration: const InputDecoration(
                          hintText: 'Enter Title', labelText: 'Title'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: description,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter Description',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (title.text.isNotEmpty && description.text.isNotEmpty) {
                      setState(() {
                        todos.add(
                            TodoModels(title.text, description.text, false));
                        title.clear();
                        description.clear();
                      });
                    }
                  },
                  child: const Text("Add Todo"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
