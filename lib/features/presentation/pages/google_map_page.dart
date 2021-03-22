import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    Key key,
    this.currentPosition,
    this.vendorPosition,
  }) : super(key: key);
  final Position currentPosition, vendorPosition;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // final Geolocator _geolocator = Geolocator();
  final Geolocator _geolocator = Geolocator();
  // Initial location of the Map view
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));

  // For storing the current position
  Position _currentPosition;
  GoogleMapController mapController;

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(widget.currentPosition.latitude,
                  widget.currentPosition.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    print(12742000 * asin(sqrt(a)));
    return 12742 * asin(sqrt(a));
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // For controlling the view of the Map

    return Container(
      height: height,
      width: width,
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              markers: {
                Marker(
                  position: LatLng(17.95678048, 102.6155897),
                  markerId: MarkerId('test'),
                )
              },
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
            Positioned(
              top: height / 3,
              left: 20,
              child: ClipOval(
                child: Material(
                  color: Colors.blue[100], // button color
                  child: InkWell(
                    splashColor: Colors.blue, // inkwell color
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(Icons.add),
                    ),
                    onTap: () {
                      // Zoom In action
                      mapController.animateCamera(
                        CameraUpdate.zoomIn(),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: height / 3 + 50,
              left: 20,
              child: ClipOval(
                child: Material(
                  color: Colors.blue[100], // button color
                  child: InkWell(
                    splashColor: Colors.blue, // inkwell color
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(Icons.remove),
                    ),
                    onTap: () {
                      // Zoom Out action
                      mapController.animateCamera(
                        CameraUpdate.zoomOut(),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 20,
              child: ClipOval(
                child: Material(
                  color: Colors.orange[100], // button color
                  child: InkWell(
                    splashColor: Colors.orange, // inkwell color
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.my_location),
                    ),
                    onTap: () async {
                      mapController.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: LatLng(
                              // Will be fetching in the next step
                              _currentPosition.latitude,
                              _currentPosition.longitude,
                            ),
                            zoom: 18.0,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
