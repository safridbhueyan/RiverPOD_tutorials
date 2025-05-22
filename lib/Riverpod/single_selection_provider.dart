import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectionProvider =
    StateNotifierProvider<SelectionNotifier, List<String>>((ref) {
  return SelectionNotifier();
});

class SelectionNotifier extends StateNotifier<List<String>> {
  SelectionNotifier() : super([]);

  void toggleSelection(String item) {
    if (state.contains(item)) {
      state = [...state]..remove(item); 
    } else if (state.length < 12) {
      state = [...state, item];
    }
  }

  bool isSelected(String item) => state.contains(item);
}
