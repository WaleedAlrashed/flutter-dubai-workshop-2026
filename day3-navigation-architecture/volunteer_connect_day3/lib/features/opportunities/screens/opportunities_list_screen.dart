import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/opportunities_provider.dart';
import '../../../shared/widgets/opportunity_card.dart';
import '../../../core/widgets/empty_view.dart';
import '../../../shared/widgets/about_instructor.dart';

class OpportunitiesListScreen extends ConsumerWidget {
  const OpportunitiesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opportunities = ref.watch(filteredOpportunitiesProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final categories = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Opportunities'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const AboutInstructor(),
              );
            },
            tooltip: 'About Instructor',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search opportunities...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () =>
                            ref.read(searchQueryProvider.notifier).state = '',
                      )
                    : null,
              ),
              onChanged: (value) =>
                  ref.read(searchQueryProvider.notifier).state = value,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: const Text('All'),
                    selected: selectedCategory == null,
                    onSelected: (_) =>
                        ref.read(selectedCategoryProvider.notifier).state =
                            null,
                  ),
                ),
                ...categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(category),
                      selected: selectedCategory == category,
                      onSelected: (_) => ref
                          .read(selectedCategoryProvider.notifier)
                          .state = selectedCategory == category
                          ? null
                          : category,
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: opportunities.isEmpty
                ? const EmptyView(
                    title: 'No opportunities found',
                    subtitle: 'Try adjusting your search or filters',
                    icon: Icons.search_off,
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: opportunities.length,
                    itemBuilder: (context, index) {
                      final opportunity = opportunities[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: OpportunityCard(
                          opportunity: opportunity,
                          onTap: () => context
                              .go('/opportunities/${opportunity.id}'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
