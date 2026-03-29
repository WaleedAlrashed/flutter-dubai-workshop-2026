import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/volunteer.dart';
import '../../auth/providers/auth_provider.dart';

final profileProvider = Provider<Volunteer?>((ref) {
  final authState = ref.watch(authProvider);
  return authState.user;
});
