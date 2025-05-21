import 'package:flutter/material.dart';
import 'package:riverpod_parctice/state_model/todo_model.dart';
import 'package:riverpod_parctice/view/count.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_parctice/view/search.dart';
import 'package:riverpod_parctice/view/todo.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SearchFilterPage(), 
    );
  }
}
