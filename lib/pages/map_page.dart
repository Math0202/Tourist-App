import 'dart:async';
import 'dart:math' show atan2, cos, pi, sin, sqrt;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:nam_tour/components/filteredItems.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(-22.615575, 17.074855);
  static const LatLng destinationLocation = LatLng(-22.6, 17.08);

  List<LatLng> polylineCoordinates = [];

  // Current location
  LocationData? currentLocation;

  @override
  void initState() {
    super.initState();
    initialize();
    getCurrentLocation();
  }

  // Initialize the polylines and current location
  Future<void> initialize() async {
    getPolyPoints();
  }

  // Set the polyline coordinates
  void getPolyPoints() {
    polylineCoordinates.add(sourceLocation);
    polylineCoordinates.add(destinationLocation);
    setState(() {}); // Trigger redraw after updating polylineCoordinates
  }

  // Get the current location and update the map
  Future<void> getCurrentLocation() async {
    Location location = Location();

    // Get the initial location
    location.getLocation().then((locationData) {
      currentLocation = locationData;

      // Move the camera to the current location
      _controller.future.then((controller) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(locationData.latitude!, locationData.longitude!),
            ),
          ),
        );
      });

      // Listen to location changes
      location.onLocationChanged.listen((newLoc) {
        currentLocation = newLoc;

        // Move the camera to the new location
        _controller.future.then((controller) {
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                zoom: 13.5,
                target: LatLng(newLoc.latitude!, newLoc.longitude!),
              ),
            ),
          );
        });

        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: currentLocation != null
                    ? LatLng(currentLocation!.latitude!, currentLocation!.longitude!)
                    : sourceLocation,
                zoom: 14.3,
              ),
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                  color: Colors.blue,
                  width: 6,
                )
              },
              markers: {
                Marker(
                  markerId: const MarkerId("source"),
                  position: sourceLocation,
                  onTap: () {
                    _showDetailsBottomSheet(context);
                  },
                ),
                if (currentLocation != null)
                  Marker(
                    markerId: const MarkerId("currentLocation"),
                    position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                    onTap: () {
                      _showDetailsBottomSheet(context);
                    },
                  ),
                Marker(
                  markerId: const MarkerId("destination"),
                  position: destinationLocation,
                  onTap: () {
                    _showDetailsBottomSheet(context);
                  },
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                if (!_controller.isCompleted) {
                  _controller.complete(controller);
                }
              },
            ),
            const SafeArea(
              child: Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        filterItems(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show details in a bottom sheet
  void _showDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: const Center(
            child: Text('Details'),
          ),
        );
      },
    );
  }
}


