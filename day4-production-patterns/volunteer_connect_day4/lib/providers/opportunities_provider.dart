import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/opportunity.dart';
import '../data/mock_data.dart';

class OpportunitiesNotifier extends Notifier<List<Opportunity>> {
  @override
  List<Opportunity> build() => mockOpportunities;

  void search(String query) {
    if (query.isEmpty) {
      state = mockOpportunities;
    } else {
      state = mockOpportunities
          .where((o) =>
              o.title.toLowerCase().contains(query.toLowerCase()) ||
              o.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

final opportunitiesProvider = NotifierProvider<OpportunitiesNotifier, List<Opportunity>>(OpportunitiesNotifier.new);
