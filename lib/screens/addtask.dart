import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:train_app_2/services/datatask.dart';

class AddTask extends StatefulWidget {
  final Map<String, dynamic>? task;

  const AddTask({super.key, this.task});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titlecon = TextEditingController();
  TextEditingController contextcon = TextEditingController();
  @override
  void initState() {
    if (widget.task != null) {
      titlecon.text = widget.task!['title'];
      contextcon.text = widget.task!['context'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task'), centerTitle: true),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: titlecon,
              decoration: InputDecoration(
                hintText: 'Task title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: contextcon,
              decoration: InputDecoration(
                hintText: 'Task context',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                if (widget.task == null) {
                  await Datatask().create(
                    titlecon.text,
                    Supabase.instance.client.auth.currentUser!.id,
                    false,
                    contextcon.text,
                  );
                } else {
                  await Datatask().update(
                    widget.task!['id'],
                    titlecon.text,
                    widget.task!['is_done'],
                    contextcon.text,
                  );
                }

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
