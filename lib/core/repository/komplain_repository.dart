import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helpdesk/core/model/komplain_model.dart';
import 'package:helpdesk/core/network/api_config.dart';
import 'package:helpdesk/core/network/http_util.dart';

final komplainRepositoryProvider = Provider<KomplainRepository>((ref) {
  return KomplainRepository();
});

class KomplainRepository {
  final HttpUtil _http = HttpUtil();

  Future<List<KomplainModel>> getKomplain({
    String? search,
    String? kategori,
  }) async {
    final response = await _http.get(
      ApiConfig.getDataKomplain,
      query: {
        "search": search,
        "kategori": kategori,
      },
    );

    if (response.success == true) {
      final List data = response.data ?? [];

      return data
          .map((e) => KomplainModel.fromJson(e))
          .toList();
    }

    return [];
  }
}