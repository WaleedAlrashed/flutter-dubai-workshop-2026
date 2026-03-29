import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/opportunity.dart';
import '../../../data/mock_data.dart';

final opportunitiesProvider = Provider<List<Opportunity>>((ref) {
  return MockData.opportunities;
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final selectedCategoryProvider = StateProvider<String?>((ref) => null);

final categoriesProvider = Provider<List<String>>((ref) {
  final opportunities = ref.watch(opportunitiesProvider);
  final categories = opportunities.map((o) => o.category).toSet().toList();
  categories.sort();
  return categories;
});

final filteredOpportunitiesProvider = Provider<List<Opportunity>>((ref) {
  final opportunities = ref.watch(opportunitiesProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final category = ref.watch(selectedCategoryProvider);

  return opportunities.where((o) {
    final matchesQuery = query.isEmpty ||
        o.title.toLowerCase().contains(query) ||
        o.organization.toLowerCase().contains(query) ||
        o.description.toLowerCase().contains(query) ||
        o.location.toLowerCase().contains(query);

    final matchesCategory = category == null || o.category == category;

    return matchesQuery && matchesCategory;
  }).toList();
});

final opportunityByIdProvider =
    Provider.family<Opportunity?, String>((ref, id) {
  final opportunities = ref.watch(opportunitiesProvider);
  try {
    return opportunities.firstWhere((o) => o.id == id);
  } catch (_) {
    return null;
  }
});
