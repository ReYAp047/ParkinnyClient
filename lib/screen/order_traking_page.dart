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

  static const LatLng sourceLocation = LatLng(36.8978, 10.1901);
  static const LatLng destination = LatLng(36.8580, 10.1844);

  List<LatLng> polylinecordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  List<LatLng> polygonPoints = const[
    LatLng(36.857020, 10.181680),
    LatLng(36.851583, 10.183963),
    LatLng(36.857867, 10.190897),
    LatLng(36.861780, 10.187057),
    LatLng(36.860009, 10.181437),
  ];

  List<LatLng> zone1 = const[
    LatLng(36.858104, 10.187180),
    LatLng(36.858026, 10.186282),
  ];
  List<LatLng> zone2 = const[
    LatLng(36.857996, 10.185089),
    LatLng(36.856067, 10.185606),
  ];
  List<LatLng> zone3 = const[
    LatLng(36.856935, 10.187526),
    LatLng(36.856947, 10.185532),
  ];
  List<LatLng> zone4 = const[
    LatLng(36.855151, 10.185584),
    LatLng(36.854072, 10.182704),
  ];




















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
        zoom: 15.5,
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
          zoom: 15.5,
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
        /*
        circles:
          {
            Circle(
              circleId: CircleId("1"),
              center: LatLng(
          currentLocation!.latitude!, currentLocation!.longitude!),
              radius: 430,
              strokeWidth: 2,
              fillColor: Color(0xFF006491).withOpacity(0.2),
            ),
          },*/
        polygons: {
          Polygon(
            polygonId: const PolygonId("0"),
            points: polygonPoints,
            strokeWidth: 2,
            strokeColor: const Color(0xFF006491).withOpacity(0.7),
            fillColor: const Color(0xFF006491).withOpacity(0.05),
          ),
          Polygon(
            polygonId: const PolygonId("1"),
            points: zone1,
            strokeWidth: 4,
            strokeColor: const Color(0xFF006491),
            fillColor: const Color(0xFF006491),
          ),
          Polygon(
            polygonId: const PolygonId("2"),
            points: zone2,
            strokeWidth: 4,
            strokeColor: const Color(0xFF006491),
            fillColor: const Color(0xFF006491),
          ),
          Polygon(
            polygonId: const PolygonId("3"),
            points: zone3,
            strokeWidth: 4,
            strokeColor: const Color(0xFF006491),
            fillColor: const Color(0xFF006491),
          ),
          Polygon(
            polygonId: const PolygonId("4"),
            points: zone4,
            strokeWidth: 4,
            strokeColor: const Color(0xFF006491),
            fillColor: const Color(0xFF006491),
          ),

        },

        onMapCreated: (mapController){
          _controller.complete(mapController);
        },
      ),
    );
  }
}





