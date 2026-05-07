import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helpdesk/core/model/dashboard_model.dart';
import 'package:helpdesk/core/repository/dashboard_repository.dart';

final dashboardControllerProvider =
    AsyncNotifierProvider<DashboardController, DashboardModel>(
      DashboardController.new,
    );

class DashboardController extends AsyncNotifier<DashboardModel> {
  DashboardRepository get repository => ref.read(dashboardRepositoryProvider);

  @override
  Future<DashboardModel> build() async {
    return getDashboard();
  }

  Future<DashboardModel> getDashboard() async {
    final result = await repository.getDashboard();

    return result;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return getDashboard();
    });
  }
}
