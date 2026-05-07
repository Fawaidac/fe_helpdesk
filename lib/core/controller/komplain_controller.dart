import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helpdesk/core/model/komplain_model.dart';
import 'package:helpdesk/core/network/paginate_response.dart';
import 'package:helpdesk/core/repository/komplain_repository.dart';

final komplainControllerProvider = AsyncNotifierProvider<
  KomplainController,
  PaginateResponse<KomplainModel>
>(
  KomplainController.new,
);

class KomplainController
    extends AsyncNotifier<PaginateResponse<KomplainModel>> {
      
  KomplainRepository get repository =>
      ref.read(komplainRepositoryProvider);

  @override
  Future<PaginateResponse<KomplainModel>> build() async {
    return getKomplain();
  }

  Future<PaginateResponse<KomplainModel>> getKomplain({
    String? search,
    String? kategori,
    bool? isDone,
    int page = 1,
  }) async {
    return repository.getKomplain(
      search: search,
      kategori: kategori,
      isDone: isDone,
      page: page,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return getKomplain();
    });
  }
}