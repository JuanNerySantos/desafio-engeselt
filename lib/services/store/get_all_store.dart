import 'package:flutter/widgets.dart';
import 'package:marketplace/data/drift/db_connection/app_db.dart';
import 'package:marketplace/repository/store/get_all_store.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart';

class GetAllStoresService {
  final BuildContext context;

  GetAllStoresService({required this.context});

  Future<List<StoreDataData>> getAllStores() async {
    try {
      final stores = await getAllStoreRepository();
      List<StoreDataData> listStore = [];

      for (var store in stores) {
        listStore.add(store);
      }

      return listStore;
    } catch (e) {
      messageError(e.toString(), context);
      return [];
    }
  }
}
