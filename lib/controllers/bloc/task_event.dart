part of 'task_bloc.dart';

@immutable
sealed class TaskEvent extends Equatable {}

final class AddTaskEvent extends TaskEvent {
  final String title;

  AddTaskEvent(this.title);

  @override
  List<Object?> get props => [title];
}

final class UpdateTaskEvent extends TaskEvent {
  final String id;
  final String title;

  UpdateTaskEvent(this.id, this.title);

  @override
  List<Object?> get props => [id, title];
}

final class RemoveTaskEvent extends TaskEvent {
  final String id;

  RemoveTaskEvent(this.id);

  @override
  List<Object?> get props => [id];
}
