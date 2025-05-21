import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_parctice/Riverpod/count_provider.dart';

class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod"),
      ),

      body: Consumer(
        builder: (context, ref, _) {
          final count = ref.watch(countProvider);
         
          return Column(
            children: [
               Text(count.toString(),
               style: TextStyle(fontWeight: FontWeight.w500,
               fontSize: 24
               ),
               ),
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton(onPressed: (){
                   ref.watch(countProvider.notifier).state++;
                 },
                 
                 child: Icon(Icons.add)
                 ),
              )
            ],
          );
        }
      ),
    );
  }
}