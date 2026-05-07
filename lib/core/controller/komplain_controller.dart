import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helpdesk/core/model/komplain_model.dart';
import 'package:helpdesk/core/repository/komplain_repository.dart';

final komplainControllerProvider =
    AsyncNotifierProvider<KomplainController, List<KomplainModel>>(
      KomplainController.new,
    );

class KomplainController extends AsyncNotifier<List<KomplainModel>> {
  KomplainRepository get repository => ref.read(komplainRepositoryProvider);

  @override
  Future<List<KomplainModel>> build() async {
    return getKomplain();
  }

  Future<List<KomplainModel>> getKomplain({
    String? search,
    String? kategori,
  }) async {
    final result = await repository.getKomplain(
      search: search,
      kategori: kategori,
    );

    return result;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return getKomplain();
    });
  }
}
