import 'package:cubiiit/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  void addTask(String title) {
    final task = TaskModel(
      id: const Uuid().v4(),
      title: title,
      isCompleted: false,
    );
    emit(UpdateTask([...state.tasksList, task]));
  }

  void removeTask(String id) {
    final updatedTasks =
        state.tasksList.where((task) => task.id != id).toList();
    emit(UpdateTask(updatedTasks));
  }

  void toggleTaskCompletion(String id) {
    final updatedTasks = state.tasksList.map((task) {
      if (task.id == id) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
    emit(UpdateTask(updatedTasks));
  }
}
