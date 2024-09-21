import 'package:flutter/material.dart';
import 'package:todoapp/widgets/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO LIST"),
      ),
      body: Column(
        children: [
          const Todo(
            title: 'First Todo App',
            description: 'This is my first to app using flutter',
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter Title', labelText: 'Title'),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                          hintText: 'Enter Description',
                        ),
                      ),
                    )),
                ElevatedButton(onPressed: () {}, child: Text("Add Todo"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
