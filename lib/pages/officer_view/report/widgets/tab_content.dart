import 'package:flutter/material.dart';
import 'package:gerald/pages/officer_view/report/widgets/empty_task.dart';

class TabContentWidget extends StatelessWidget {
  final int index;
  final List<String> tasks;

  const TabContentWidget({
    required this.index,
    required this.tasks,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return EmptyStateWidget(
        onButtonPressed: () {
          print("Buat laporan button pressed");
        },
      );
    }
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            title: Text(tasks[i]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Add your edit action here
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Add your delete action here
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
