import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

Future<LatLng?> getCoordinatesFromCep(String cep) async {
  try {
    List<Location> locations = await locationFromAddress('$cep, Brasil');

    if (locations.isNotEmpty) {
      final lat = locations.first.latitude;
      final lng = locations.first.longitude;
      return LatLng(lat, lng);
    } else {
      print('Nenhuma localização encontrada.');
    }
  } catch (e) {
    print('Erro ao obter localização: $e');
  }

  return null;
}
