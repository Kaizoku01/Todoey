import 'package:flutter/material.dart';
import 'package:todoey/Screens/Add_Task_Screen.dart';
import 'package:todoey/Widgets/TasksList.dart';
import 'package:todoey/constants.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Modals/task_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: kAddCardDecoration,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kListIcon,
                kHeadText,
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Task',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: kCardDecoration,
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
