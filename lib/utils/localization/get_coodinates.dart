import 'package:geocoding/geocoding.dart';

Future<String?> getCoordinatesFromCep(String cep) async {
  try {
    List<Location> locations = await locationFromAddress('$cep, Brasil');

    if (locations.isNotEmpty) {
      final lat = locations.first.latitude;
      final lng = locations.first.longitude;
      return '$lat, $lng';
    } else {
      throw Exception('Nenhuma localização encontrada.');
    }
  } catch (e) {
    throw Exception('Erro ao obter localização: $e');
  }
}
