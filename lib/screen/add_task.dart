import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = ''; // Initialize with an empty string

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), // Default underline color
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue), // Blue underline when focused
              ),
            ),
            onChanged: (newValue) {
              newTaskTitle = newValue; // Update the newTaskTitle as user types
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              // Check if the new task title is not empty before adding it
              if (newTaskTitle.isNotEmpty) {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle); // Add the task using the provider
                Navigator.pop(context); // Close the bottom sheet after adding task
              } else {
                // Optional: Show a snackbar or an alert if the task is empty
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a task title!'),
                  ),
                );
              }
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
              padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Sharp edges for boxy appearance
                ),
              ),
            ),
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white), // Set text color explicitly
            ),
          ),
        ],
      ),
    );
  }
}
