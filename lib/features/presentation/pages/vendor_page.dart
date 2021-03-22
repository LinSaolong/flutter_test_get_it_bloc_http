import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test_get_it_bloc_http/features/presentation/pages/google_map_page.dart';
import 'package:geolocator/geolocator.dart';

class VendorPage extends StatefulWidget {
  VendorPage({Key key, this.position}) : super(key: key);
  final Position position;

  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  double distance;
  Position position;
  Position venderPosition =
      Position(latitude: 17.9567810, longitude: 102.615589700);
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    // distance = _coordinateDistance(
    //     position.latitude, position.longitude, 17.9567810, 102.615589700);
    // distance = Geolocator.distanceBetween(
    //     position.latitude, position.longitude, 17.9567810, 102.615589700);
  }

  getDistance() {
    distance = Geolocator.distanceBetween(
        widget.position.latitude,
        widget.position.longitude,
        venderPosition.latitude,
        venderPosition.longitude);
  }

  getVendor() async {
    await getCurrentLocation();
    await getDistance();
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742000 * asin(sqrt(a));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDistance();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: size.height * .2),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MapPage(
                    vendorPosition: venderPosition,
                    currentPosition: widget.position,
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              width: size.width * .8,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: Saolong'),
                  Text("Distance: ${distance.toStringAsFixed(2)} m")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
