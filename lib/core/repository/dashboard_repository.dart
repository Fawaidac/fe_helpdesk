import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helpdesk/core/model/dashboard_model.dart';
import 'package:helpdesk/core/network/api_config.dart';
import 'package:helpdesk/core/network/http_util.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository();
});

class DashboardRepository {
  final HttpUtil _http = HttpUtil();

  Future<DashboardModel> getDashboard() async {
    final response = await _http.get(ApiConfig.getDataDashboard);

    if (response.success == true) {
      return DashboardModel.fromJson(response.data);
    }

    throw Exception(response.message);
  }
}
