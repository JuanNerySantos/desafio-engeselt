import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:marketplace/services/get_all_store.dart';
import 'package:marketplace/services/store_maker.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final MapController _mapController = MapController();

  final TextEditingController searchController = TextEditingController();
  List<LatLng> storeLatLngs = [];
  LatLng initialCenter = LatLng(-23.5505, -46.6333);
  List<StoreMarker> storeMarkers = [];

  @override
  void initState() {
    super.initState();
    _loadStoreLatLngs();
  }

  Future<void> _loadStoreLatLngs() async {
    final stores = await GetAllStoresService().getAllStores();

    List<StoreMarker> tempMarkers = [];

    for (var store in stores) {
      if (store.latlong.isNotEmpty) {
        final parts = store.latlong.split(',');
        if (parts.length == 2) {
          final lat = double.tryParse(parts[0].trim());
          final lng = double.tryParse(parts[1].trim());
          if (lat != null && lng != null) {
            tempMarkers.add(
              StoreMarker(position: LatLng(lat, lng), store: store),
            );
          }
        }
      }
    }

    setState(() {
      storeMarkers = tempMarkers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,

            options: MapOptions(
              initialCenter: initialCenter,
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers:
                    storeMarkers.map((storeMarker) {
                      return Marker(
                        width: 80.0,
                        height: 80.0,
                        point: storeMarker.position,
                        child: IconButton(
                          icon: Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 40,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: Text(storeMarker.store.nameStore),
                                    content: Container(
                                      height: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Column(
                                        // mainAxisAlignment: ,
                                        children: [
                                          Text(
                                            'Endereço: \n${storeMarker.store.cep}',
                                          ),
                                          Text(
                                            'Telefone: \n${storeMarker.store.phone}',
                                          ),
                                          Text(
                                            'Estado: \n${storeMarker.store.city}',
                                          ),
                                          Text(
                                            'Rua: \n${storeMarker.store.street}',
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Fechar'),
                                      ),
                                    ],
                                  ),
                            );
                          },
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xB5F4D16F),
                  hintText: 'Procure aqui...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                controller: searchController,
                onChanged: (value) async {
                  if (value.length < 2) return;

                  final matchedStore = storeMarkers.firstWhere(
                    (storeMarker) => storeMarker.store.nameStore
                        .toLowerCase()
                        .contains(value.toLowerCase()),
                    orElse:
                        () => StoreMarker(
                          position: initialCenter,
                          store: storeMarkers.first.store,
                        ),
                  );

                  _mapController.move(
                    matchedStore.position,
                    16.0,
                  ); // Move e dá zoom
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
