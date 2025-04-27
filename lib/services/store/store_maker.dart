import 'package:latlong2/latlong.dart';
import 'package:marketplace/data/drift/db_connection/app_db.dart';

class StoreMarker {
  final LatLng position;
  final StoreDataData store;

  StoreMarker({required this.position, required this.store});
}
