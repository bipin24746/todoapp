import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  final String title;
  final String description;

  const Todo({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (color == Colors.red) {
          color = Colors.green;
        } else {
          color = Colors.red;
        }
        setState(() {});
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(widget.description)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
