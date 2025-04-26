import 'package:marketplace/data/drift/db_connection/app_db.dart';
import 'package:marketplace/repository/get_all_store.dart';

class GetAllStoresService {
  Future<List<StoreDataData>> getAllStores() async {
    final stores = await getAllStoreRepository();
    List<StoreDataData> listStore = [];

    for (var store in stores) {
      listStore.add(store);
    }

    return listStore;
  }
}
