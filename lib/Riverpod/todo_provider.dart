import 'package:riverpod/riverpod.dart';
import 'package:riverpod_parctice/state_model/todo_model.dart';
import 'package:uuid/uuid.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>(
  (ref){
    return TodoNotifier();
  }
);

class TodoNotifier extends StateNotifier<List<Todo>>{
  TodoNotifier():super([]);

  void addTodo(String title){
  final newTodo = Todo(id: Uuid().v4(), title: title);
  state = [...state, newTodo];}

  void deleteTodo(String id){
    state = state.where((todo)=> todo.id != id).toList();
  }
  void toggleTodo(String id){
    state = state.map((todo){
      if (todo.id == id){
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }
     return todo;
    }).toList();
  }
}