import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/cubits.dart';
import 'package:todo/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo/pages/todoPages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<TodoSearchCubit>(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<ActiveTodoCountCubit>(
          create: (context) => ActiveTodoCountCubit(
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
          ),
        ),
        BlocProvider<FilteredTodoCubit>(
          create: (context) => FilteredTodoCubit(
            todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
            todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodosPage(),
      ),
    );
  }
}
