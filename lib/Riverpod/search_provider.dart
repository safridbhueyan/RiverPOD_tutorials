
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_parctice/model/user_model.dart';
final searchQueryProvider = StateProvider<String>(
  (ref){
    return '';
  }
);
final filteredUsersProvider = Provider<List<User>>(
  (ref){
    final search = ref.watch(searchQueryProvider);
     return User.allUsers.where((user) {
    return user.name.toLowerCase().contains(search.toLowerCase());
  }).toList();
}
);

