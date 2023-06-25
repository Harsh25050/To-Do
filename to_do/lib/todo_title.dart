import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTitle extends StatelessWidget {
  final String taskName;
  final bool taskCompeleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTitle({
    super.key,
    required this.taskName,
    required this.taskCompeleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(value: taskCompeleted, onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompeleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
