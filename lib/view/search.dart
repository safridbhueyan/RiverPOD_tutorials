import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_parctice/Riverpod/search_provider.dart';

class SearchFilterPage extends StatelessWidget {
  const SearchFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent, 
        title: Text('Search & Filter Users')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer(
          builder: (context, ref, _) {
            final filteredUsers = ref.watch(filteredUsersProvider);
            return Column(
              children: [
                TextField(
                  onChanged: (value) {
                    ref.read(searchQueryProvider.notifier).state = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Search...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 20),

                Expanded(
                  child:
                      filteredUsers.isEmpty
                          ? Center(child: Text('No users found'))
                          : ListView.builder(
                            itemCount: filteredUsers.length,
                            itemBuilder: (context, index) {
                              final user = filteredUsers[index];
                              return ListTile(title: Text(user.name));
                            },
                          ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
