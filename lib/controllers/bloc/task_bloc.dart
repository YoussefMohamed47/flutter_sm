import 'package:cubiiit/controllers/cubit/task_cubit.dart';
import 'package:cubiiit/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'task_event.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>((event, emit) {
      final task = TaskModel(
        id: const Uuid().v4(),
        title: event.title,
        isCompleted: false,
      );
      emit(UpdateTask([...state.tasksList, task]));
    });

    on<UpdateTaskEvent>((event, emit) {
      final updatedTasks = state.tasksList.map((task) {
        if (task.id == event.id) {
          return task.copyWith(
              isCompleted: !task.isCompleted, title: event.title);
        }
        return task;
      }).toList();
      emit(UpdateTask(updatedTasks));
    });
    on<RemoveTaskEvent>((event, emit) {
      final updatedTasks =
          state.tasksList.where((task) => task.id != event.id).toList();
      emit(UpdateTask(updatedTasks));
    });
  }
}
