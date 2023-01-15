import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/Utilities/myButton.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.white,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //CHECKBOX
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
                checkColor: Colors.white,
                //fillColor: Colors.grey[600],
              ),
              //TASK NAME
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: Colors.white),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
