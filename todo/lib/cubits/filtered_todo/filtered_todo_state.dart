part of 'filtered_todo_cubit.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filteredTodos;
  const FilteredTodoState({
    required this.filteredTodos,
  });

  factory FilteredTodoState.initial() {
    return FilteredTodoState(filteredTodos: []);
  }

  @override
  List<Object> get props => [];

  FilteredTodoState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodoState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  @override
  bool get stringify => true;
}
