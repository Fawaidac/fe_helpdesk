import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helpdesk/core/model/komplain_model.dart';
import 'package:helpdesk/core/network/api_config.dart';
import 'package:helpdesk/core/network/http_util.dart';
import 'package:helpdesk/core/network/paginate_response.dart';

final komplainRepositoryProvider = Provider<KomplainRepository>((ref) {
  return KomplainRepository();
});

class KomplainRepository {
  final HttpUtil _http = HttpUtil();

  Future<PaginateResponse<KomplainModel>> getKomplain({
    String? search,
    String? kategori,
    bool? isDone,
    int page = 1,
  }) async {
    final response = await _http.get(
      ApiConfig.getDataKomplain,
      query: {
        "search": search,
        "kategori": kategori,
        "is_done": isDone,
        "page": page,
      },
    );

    if (response.success == true) {
      return PaginateResponse<KomplainModel>.fromJson(
        response.data,
        (e) => KomplainModel.fromJson(e),
      );
    }

    return PaginateResponse(currentPage: 1, lastPage: 1, total: 0, data: []);
  }
}
