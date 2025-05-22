import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_parctice/Riverpod/single_selection_provider.dart';

class SelectCatagoryScreen extends ConsumerWidget {
  const SelectCatagoryScreen({super.key});

  final List<String> names = const [
    "games", "camera", "music", "dance", "utopia", "DC",
    "comics", "MIA", "trap", "LA", "Rain", "Food"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectionProvider);
    final notifier = ref.read(selectionProvider.notifier);
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
      body: 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hi! Maren Workman',
                    style: headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Up to 5 Prompts for your Possy",
                    style: titleSmall?.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 2.1,
                    ),
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      final name = names[index];
                      final isSelected = selected.contains(name);
                      return GestureDetector(
                        onTap: () => notifier.toggleSelection(name),
                        child: SelectTile(text: name, isSelected: isSelected),//gettting error here fix
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected: ${selected.join(', ')}')),
                    );
                  },
                  child: const Text("Done"),
                ),
                const SizedBox(height: 40),
            ]))
            );
        
      
    
    
  }
}
class SelectTile extends StatelessWidget {
  final String text;
  final bool isSelected;

  const SelectTile({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple.withOpacity(0.7) : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (isSelected)
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.check_circle, color: Colors.white, size: 18),
              ),
            ),
        ],
      ),
    );
  }
}

