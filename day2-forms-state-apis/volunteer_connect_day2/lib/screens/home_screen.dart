import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/opportunities_provider.dart';
import '../widgets/opportunity_card.dart';
import '../widgets/about_instructor.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;
  const HomeScreen({super.key, required this.onToggleTheme, required this.isDark});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final opportunities = ref.watch(opportunitiesProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Opportunities'),
        backgroundColor: colorScheme.inversePrimary,
        actions: [
          IconButton(icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode), onPressed: widget.onToggleTheme),
          IconButton(icon: const Icon(Icons.person), onPressed: () => Navigator.pushNamed(context, '/profile')),
          IconButton(icon: const Icon(Icons.info_outline), onPressed: () => showInstructorDialog(context)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                hintText: 'Search opportunities...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: _searchCtrl.text.isNotEmpty
                    ? IconButton(icon: const Icon(Icons.clear), onPressed: () {
                        _searchCtrl.clear();
                        ref.read(opportunitiesProvider.notifier).search('');
                        setState(() {});
                      })
                    : null,
              ),
              onChanged: (v) {
                ref.read(opportunitiesProvider.notifier).search(v);
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: opportunities.isEmpty
                ? const Center(child: Text('No opportunities found'))
                : ListView.builder(
                    itemCount: opportunities.length,
                    itemBuilder: (ctx, i) => OpportunityCard(
                      opportunity: opportunities[i],
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Signed up for ${opportunities[i].title}!')),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/log-hours'),
        icon: const Icon(Icons.add),
        label: const Text('Log Hours'),
      ),
    );
  }
}
