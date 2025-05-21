import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_parctice/Riverpod/search_provider.dart';

class SearchFilterPage extends ConsumerWidget {
  const SearchFilterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredUsers = ref.watch(filteredUsersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search & Filter Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              child: filteredUsers.isEmpty
                  ? Center(child: Text('No users found'))
                  : ListView.builder(
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = filteredUsers[index];
                        return ListTile(
                          title: Text(user.name),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
