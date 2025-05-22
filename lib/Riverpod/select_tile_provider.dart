import 'package:riverpod/riverpod.dart';

final SelectTileProvider = StateNotifierProvider<selectNotifier,bool>((ref){
  return selectNotifier();
});

class selectNotifier extends StateNotifier<bool>{
  selectNotifier():super(false);

  void toggle(){

    state = !state;

    
  }
}