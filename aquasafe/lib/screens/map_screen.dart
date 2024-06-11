import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.7749, -122.4194);
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _markers.add(
      Marker(
        markerId: MarkerId('id-1'),
        position: _center,
        infoWindow: InfoWindow(
          title: 'San Francisco',
          snippet: 'An interesting city',
        ),
      ),
    );
  }

  void _requestPermissions() async {
    await Permission.locationWhenInUse.request();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AquaSafe Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: _markers,
      ),
    );
  }
}
