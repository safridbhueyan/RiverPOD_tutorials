import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_parctice/Riverpod/select_tile_provider.dart';

class Isselected extends StatelessWidget {
  const Isselected({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IsSelected"),
        centerTitle: true,
      ),

      body: Consumer(
        builder: (context, ref, _) {
          final isTaped = ref.watch(SelectTileProvider);
          return Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    
                    ref.read(SelectTileProvider.notifier).toggle();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isTaped? const Color.fromARGB(255, 9, 140, 206) : Colors.grey,
                      border: Border.all(
                        width: 2,
                        color: isTaped? const Color.fromARGB(255, 17, 21, 42) : Colors.blueAccent
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("safrid"),
                    )),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}