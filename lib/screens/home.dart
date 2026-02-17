import 'package:flutter/material.dart';

import 'package:train_app_2/screens/addtask.dart';
import 'package:train_app_2/screens/login.dart';
import 'package:train_app_2/services/auth.dart';

import 'package:train_app_2/services/datatask.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> tasks = [];
  loadtask() async {
  try {
    tasks = await Datatask().read();
    setState(() {});
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error loading tasks')),
    );
  }
}

  @override
  void initState() {
    loadtask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        },

        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('My Tasks'),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            onPressed: () async {
              await AuthTask().signout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginTask()));
            },

            label: Text('logout'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await loadtask();
        },
        child: ListView.separated(
          itemBuilder: (BuildContext, i) {
            final task = tasks[i];
            return ListTile(
              leading: CircleAvatar(child: Icon(Icons.task)),
              title: Text(task['title']),
              subtitle: Text(task['context']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      bool netstat = !task['is_done'];
                      await Datatask().update(
                        task['id'],
                        task['title'],
                        netstat,
                        task['context'],
                      );
                      loadtask();
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: task['is_done']
                            ? Colors.green
                            : Colors.redAccent,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTask(task: task),
                        ),
                      ).then((_) {
                        loadtask();
                      });
                    },
                    child: Text('Edit'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Delete Task?'),
                          actions: [
                            ElevatedButton(
                              onPressed: () async {
                                await Datatask().delete(task['id']);
                                loadtask();
                                Navigator.of(context).pop();
                              },
                              child: Text('Yes'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext, i) {
            return SizedBox();
          },
          itemCount: tasks.length,
        ),
      ),
    );
  }
}
