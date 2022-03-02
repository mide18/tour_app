import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../models/address.dart';
import '../../provider/map_state_provider.dart';
import '../../services/auth_service.dart';
import '../../services/map_service.dart';
import '../ui/user_info_window_screen.dart';
import '../widget/bottom_slider.dart';
import '../widget/search_map_address.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapState>();
    return SizedBox(
      key: key,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ValueListenableBuilder<Address?>(
        valueListenable: state.currentPosition,
        builder: (context, currentPosition, child) {
          if (currentPosition == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              ValueListenableBuilder<List<Marker>?>(
                  valueListenable: MapService.instance!.markers,
                  builder: (context, markers, child) {
                    return GoogleMap(
                      mapType: MapType.normal,
                      polylines: state.polylines,
                      markers: markers?.toSet() ?? {},
                      initialCameraPosition: CameraPosition(
                        target: currentPosition.latLng,
                        zoom: 15,
                      ),
                      onMapCreated: state.onMapCreated,
                      onTap: state.onTapMap,
                      onCameraMove: state.onCameraMove,
                    );
                  }),
              CustomInfoWindow(
                controller: MapService.instance!.controller,
                height: MediaQuery.of(context).size.width * 0.12,
                width: MediaQuery.of(context).size.width * 0.4,
                offset: 50,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.exit_to_app),
                      onPressed: () {
                        AuthService.instance?.logOut();
                        MapService.instance?.dispose();
                      },
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                child: BottomSlider(),
              ),
              state.rideState == RideState.searchingAddress
                  ? const Positioned(top: 10, left: 15, right: 15, child: SearchMapBar())
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}

class MapViewWidget extends StatelessWidget {
  const MapViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = MapState();
    return ChangeNotifierProvider(
      create: (_) => state,
      child: const MapView(key: const ValueKey('map')),
    );
  }
}