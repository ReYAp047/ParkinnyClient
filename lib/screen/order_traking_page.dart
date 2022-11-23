import 'dart:async';
import 'package:location/location.dart';
import 'package:parkinny/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.4221, -122.0841);
  static const LatLng destination = LatLng(37.4116, -122.0713);

  List<LatLng> polylinecordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation () async {
    Location location = Location();


    location.getLocation().then(
            (location){
              currentLocation = location;
            }
            );

    GoogleMapController googleMapController = await _controller.future;


    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        zoom: 14.5,
          target: LatLng(
            newLoc.latitude!,
            newLoc.longitude!,
          )),
      ),
      );
      
      setState(() {});
    });
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/sourceIcon.png")
        .then(
            (icon) {
          sourceIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/LogoP_ugwynb.png")
        .then(
            (icon) {
          destinationIcon = icon;
        });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/curerrentLocation.png")
        .then(
            (icon) {
          currentLocationIcon = icon;
        });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude),
    );
    if(result.points.isNotEmpty) {
      result.points.forEach(
              (PointLatLng point)=>polylinecordinates.add(
                  LatLng(point.latitude, point.longitude)
              )
      );
      setState(() {});
    }
  }

  @override
  void initState(){
    getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: currentLocation == null
          ? const Center(child: Text("Chargement"))
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
              currentLocation!.latitude!, currentLocation!.longitude!),
          zoom: 14.5,
      ),
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylinecordinates,
            color: primaryColor,
            width: 6
          ),
        },
        markers: {
           Marker(
              markerId: const MarkerId("currentLocation"),
              icon: currentLocationIcon,
              position: LatLng(
                  currentLocation!.latitude!, currentLocation!.longitude!)
          ),
           Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            markerId: const MarkerId("source"),
            position: sourceLocation
          ),
           Marker(
              icon: destinationIcon,
              markerId: const MarkerId("destination"),
              position: destination
          ),
        },
        onMapCreated: (mapController){
          _controller.complete(mapController);
        },
      ),
    );
  }
}
