import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdata/Config/Config.dart';
import 'package:flutterdata/main.data.dart';
import 'package:flutter_data/flutter_data.dart';

import 'Models/Task/Task.dart';

void main() {
  runApp(ProviderScope(
    child: const TaskApp(),
    overrides: [configureRepositoryLocalStorage(clear: true)],
  ));
}

class TaskApp extends ConsumerWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ref.watch(repositoryInitializerProvider()).when(
                error: (error, _) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
                data: (_) => const TaskScreen(),
              ),
        ),
      ),
    );
  }
}

class TaskScreen extends ConsumerWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.tasks.watchAll(params: {'_limit': 5}, syncLocal: true);
    final _newTaskController = TextEditingController();

    if (state.isLoading) {
      return const CircularProgressIndicator();
    }
    return RefreshIndicator(
      onRefresh: () =>
          ref.tasks.findAll(params: {'_limit': 5}, syncLocal: true),
      child: ListView(
        children: [
          TextField(
            controller: _newTaskController,
            onSubmitted: (value) async {
              Task(title: value.trim()).init(ref.read).save();
              _newTaskController.clear();
            },
          ),
          for (final task in state.model)
            Dismissible(
              key: ValueKey(task),
              direction: DismissDirection.endToStart,
              onDismissed: (_) => task.delete(),
              child: ListTile(
                leading: Checkbox(
                  value: task.completed,
                  onChanged: (bool? value) => task.toggleCompleted(task).save(),
                ),
                title: Text('${task.title} [id: ${task.id}]'),
              ),
            )
        ],
      ),
    );
  }
}
