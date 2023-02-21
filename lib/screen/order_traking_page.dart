import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:parkinny/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as map_tool;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'login_register_page.dart';
class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(36.8978, 10.1901);
  static LatLng destination = const LatLng(36.8580, 10.1844);
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


  List<LatLng> polygonPointsMarsa = const[
    LatLng(36.903356, 10.289257),
    LatLng(36.893350, 10.296246),
    LatLng(36.870213, 10.312339),
    LatLng(36.876554, 10.326520),
    LatLng(36.879433, 10.327571),
    LatLng(36.880622, 10.326809),
    LatLng(36.881046, 10.327077),
    LatLng(36.885093, 10.328612),
    LatLng(36.885496, 10.328563),
    LatLng(36.885835, 10.328794),
    LatLng(36.887311, 10.330961),
    LatLng(36.887714, 10.330076),
    LatLng(36.888439, 10.329143),
    LatLng(36.890177, 10.326064),
    LatLng(36.887714, 10.330076),
    LatLng(36.891357, 10.324486),
    LatLng(36.891571, 10.323912),
    LatLng(36.893017, 10.322217),
    LatLng(36.892987, 10.322148),
    LatLng(36.893463, 10.321879),
    LatLng(36.894150, 10.321692),
    LatLng(36.895999, 10.321584),
    LatLng(36.897093, 10.320780),
    LatLng(36.898457, 10.320372),
    LatLng(36.899392, 10.318671),
    LatLng(36.901550, 10.316858),
    LatLng(36.903262, 10.316493),
    LatLng(36.916933, 10.317982),
    LatLng(36.917628, 10.315785),
    LatLng(36.916811, 10.313639),
    LatLng(36.916525, 10.312549),
    LatLng(36.914834, 10.312827),
    LatLng(36.915077, 10.306690),
    LatLng(36.912357, 10.302356),
    LatLng(36.903740, 10.289663),
  ];
  List<LatLng> zone5 = const[
    LatLng(36.878963, 10.315397),
    LatLng(36.873775, 10.318875),
  ];
  List<LatLng> zone6 = const[
    LatLng(36.878987, 10.315485),
    LatLng(36.881392, 10.321499),
  ];
  List<LatLng> zone7 = const[
    LatLng(36.886673, 10.310315),
    LatLng(36.889172, 10.317182),
  ];
  List<LatLng> zone8 = const[
    LatLng(36.888775, 10.321124),
    LatLng(36.884512, 10.311678),
  ];


  List<LatLng> rue1 = const[
    LatLng(36.8793889, 10.3331063),
    LatLng(36.8791582, 10.3325393),
  ];
  List<LatLng> rue2 = const[
    LatLng(36.8790577, 10.3323794),
    LatLng(36.8788289, 10.3318343),
  ];
  List<LatLng> rue3 = const[
    LatLng(36.8781448, 10.3332709),
    LatLng(36.8780048, 10.3329501),
  ];
  List<LatLng> rue4 = const[
    LatLng(36.8773769, 10.3290904),
    LatLng(36.8771798, 10.3292147),
  ];
  List<LatLng> rue5 = const[
    LatLng(36.8770664, 10.3293100),
    LatLng(36.8767786, 10.3295101),
  ];
  List<LatLng> rue6 = const[
    LatLng(36.8766018, 10.3296167),
    LatLng(36.8760123, 10.3300124),
  ];
  List<LatLng> rue7 = const[
    LatLng(36.8758688, 10.3301197),
    LatLng(36.8756701, 10.3302437),
  ];
  List<LatLng> rue8 = const[
    LatLng(36.8754051, 10.3304462),
    LatLng(36.8741609, 10.3313139),
  ];
  List<LatLng> rue9 = const[
    LatLng(36.8773557, 10.3289606),
    LatLng(36.8760260, 10.3298612),
  ];
  List<LatLng> rue10 = const[
    LatLng(36.8758477, 10.3299627),
    LatLng(36.8747942, 10.3307379),
  ];

  List<LatLng> rue11 = const[
    LatLng(36.8778736, 10.3285848),
    LatLng(36.8784854, 10.3281238),
  ];
  List<LatLng> rue12 = const[
    LatLng(36.8790716, 10.3275042),
    LatLng(36.8770658, 10.3266328),
  ];
  List<LatLng> rue13 = const[
    LatLng(36.8770537, 10.3266965),
    LatLng(36.8789276, 10.3274948),
  ];
  List<LatLng> rue14 = const[
    LatLng(36.8810846, 10.3269996),
    LatLng(36.8821281, 10.3274157),
  ];
  List<LatLng> rue15 = const[
    LatLng(36.8823255, 10.3274991),
    LatLng(36.8829257, 10.3276933),
  ];
  List<LatLng> rue16 = const[
    LatLng(36.8830643, 10.3277633),
    LatLng(36.8833177, 10.3278562),
  ];
  List<LatLng> rue17 = const[
    LatLng(36.8835001, 10.3279430),
    LatLng(36.8843159, 10.328229),
  ];
  List<LatLng> rue18 = const[
    LatLng(36.8853979, 10.3300456),
    LatLng(36.8844800, 10.3319717),
  ];
  List<LatLng> rue19 = const[
    LatLng(36.8838436, 10.3326399),
    LatLng(36.8832129, 10.3331261),
  ];
  List<LatLng> rue20 = const[
    LatLng(36.8820946, 10.3299577),
    LatLng(36.8798759, 10.3286086),
  ];


  List<LatLng> rue21 = const[
    LatLng(36.8756245, 10.3326979),
    LatLng(36.8766053, 10.3362150),
  ];
  List<LatLng> rue22 = const[
    LatLng(36.8826486, 10.3326054),
    LatLng(36.8824062, 10.3322037),
  ];
  List<LatLng> rue23 = const[
    LatLng(36.8823046, 10.3322896),
    LatLng(36.8825904, 10.332696),
  ];
  List<LatLng> rue24 = const[
    LatLng(36.8661505, 10.3354442),
    LatLng(36.8636315, 10.3298628),
  ];
  List<LatLng> rue25 = const[
    LatLng(36.8824869, 10.3343455),
    LatLng(36.8831045, 10.3335217),
  ];
  List<LatLng> rue26 = const[
    LatLng(36.8832810, 10.3335334),
    LatLng(36.8834593, 10.3338234),
  ];
  List<LatLng> rue27 = const[
    LatLng(36.8835119, 10.3339368),
    LatLng(36.8835422, 10.3342026),
  ];
  List<LatLng> rue28 = const[
  LatLng(36.8853805, 10.3328089),
  LatLng(36.8867814, 10.3307158),
  ];

  List<LatLng> polygonPointsMourouj = const[
    LatLng(36.857020, 10.181680),
    LatLng(36.851583, 10.183963),
    LatLng(36.857867, 10.190897),
    LatLng(36.861780, 10.187057),
    LatLng(36.860009, 10.181437),
  ];



  bool isSelectedArea = true;

  bool follow = false;

  bool laMarsa = true;
  static const LatLng marsaLocation = LatLng(36.887706, 10.321401);
  bool ariana = true;
  static const LatLng arianaLocation = LatLng(36.858244, 10.184703);

  void checkUpdatedLocation(LatLng pointLatLng) {
    setState(() {
      //mise a jour de l'iténéraire
      polylinecordinates.clear();
      destination = pointLatLng;
      getPolyPoints();


      //if the zone is supported so true
      List<map_tool.LatLng> convertedPolygonPoints = polygonPoints.map(
              (point) => map_tool.LatLng(point.latitude,point.longitude)
      ).toList();
      isSelectedArea = map_tool.PolygonUtil.containsLocation(
          map_tool.LatLng(pointLatLng.latitude, pointLatLng.longitude),
          convertedPolygonPoints,
          false,
      );

      List<map_tool.LatLng> convertedPolygonPointsMarsa = polygonPointsMarsa.map(
              (point) => map_tool.LatLng(point.latitude,point.longitude)
      ).toList();
      isSelectedArea = map_tool.PolygonUtil.containsLocation(
        map_tool.LatLng(pointLatLng.latitude, pointLatLng.longitude),
        convertedPolygonPointsMarsa,
        false,
      );
    });

  }

  void getCurrentLocation () async {
    Location location = Location();


    location.getLocation().then(
            (location){
              currentLocation = location;
            }
            );

    GoogleMapController googleMapController = await _controller.future;

    if(follow){
      followCurrentLocation(location, googleMapController );
    }

  }
  
  void followCurrentLocation(Location location, GoogleMapController googleMapController){
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
if(currentLocation != null){
  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    google_api_key,
    PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
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
}else{

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
  }

  @override
  void initState(){
    getCurrentLocation();
    getPolyPoints();
    setCustomMarkerIcon();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: currentLocation == null
          ? const Center(child: Text("Chargement"))
          :Stack(
        children: [
          GoogleMap(
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
                    currentLocation!.latitude!, currentLocation!.longitude!),
                onDrag: (updatedLatLng){
                  checkUpdatedLocation(updatedLatLng);
                },
              ),
              /* Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            markerId: const MarkerId("source"),
            position: sourceLocation
          ),*/
              Marker(
                icon: destinationIcon,
                markerId: const MarkerId("destination"),
                position: destination,
                draggable: true,
                onDragEnd: (updatedLatLng){
                  checkUpdatedLocation(updatedLatLng);
                },
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
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("2"),
                points: zone2,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("3"),
                points: zone3,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("4"),
                points: zone4,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("0"),
                points: polygonPointsMarsa,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491).withOpacity(0.7),
                fillColor: const Color(0xFF006491).withOpacity(0.3),
              ),
              Polygon(
                polygonId: const PolygonId("5"),
                points: zone5,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("6"),
                points: zone6,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("7"),
                points: zone7,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: zone8,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue1,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue2,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue3,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue4,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue5,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue6,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue7,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue8,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue9,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue10,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue11,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue12,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue13,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue14,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue15,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue16,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue17,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue18,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue19,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue20,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue21,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue22,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue23,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue24,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue25,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue26,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue27,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: rue28,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),

              Polygon(
                polygonId: const PolygonId("9"),
                points: polygonPointsMourouj,
                strokeWidth: 2,
                strokeColor: const Color(0xFF006491).withOpacity(0.7),
                fillColor: const Color(0xFF006491).withOpacity(0.3),
              ),

            },
            onMapCreated: (mapController){
              _controller.complete(mapController);
            },
          ),
          searchBarUI(),
        ],
      ),


        floatingActionButton: FloatingActionButton.extended(
    onPressed: isSelectedArea ? () => submitData(context) : null, //<-- SEE HERE

    label: const Text('Confirmer la réservation'),
    icon: const Icon(Icons.data_saver_on_rounded),
    backgroundColor: isSelectedArea ? const Color(0xFF006491) : Colors.grey,

    ),



    );
  }
  submitData(context) async {
    final TimeOfDay currentTime = TimeOfDay.now();
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );
    if(newTime != null){
      final now = DateTime.now();

      String formattedDate = DateFormat('dd-MM-yyyy').format(now);

      DateTime t = DateTime(now.year, now.month, now.day, newTime.hour, newTime.minute);
      final difference = t.difference(now);
      String time = "${now.hour}:${now.minute}";
      String timeUntil = "${newTime.hour}:${newTime.minute}";

      String formattedMsgDate = "De: $time";
      String formattedMsgNewTime = "À: $timeUntil";
      int diff = difference.inHours.toInt()+1;
      String formattedTime = "$diff heurs";
      double total = diff * 1.340;
      String formattedPriceMsg = "$total DINAR";
      String clientAddresse = "add";

      var url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=${destination.latitude},${destination.longitude}&key=AIzaSyAMQbRgwih4j8CJhFBzPqwvlHJmAVVahxI';
      var response = await http.get(Uri.parse(url));
      var json = jsonDecode(response.body);
      var address = json['results'][0]['formatted_address'];

        clientAddresse = address;

      if(GlobalVariables.clientWallet>= total) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Ticket de réservation'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Row(
                      children: [
                        const Icon(Icons.location_city),
                        Text(clientAddresse),
                      ],
                    ),

                    Row(
                      children: [
                        const Icon(Icons.calendar_today),
                        Text(formattedDate),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.date_range),
                        Text("$formattedMsgDate - $formattedMsgNewTime"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.timer),
                        Text(formattedTime),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.money),
                        Text(formattedPriceMsg),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.car_crash),
                        Text('247 TN 9999'),
                      ],
                    ),

                  ],
                ),
              ),

              actions: <Widget>[

                TextButton(
                  child: const Text('Annuler'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Valider'),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Réservation effectué avec succes",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    follow = true;
                    getCurrentLocation();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      }else{
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Solde insuffisant'),
              content: const Text('Votre solde n\'est pas suffisant pour cette action, merci de recharger votre wallet.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

      }



    }

  }

  Widget searchBarUI(){
    return FloatingSearchBar(
      hint: 'Search...',
      openAxisAlignment: 0.0,
      //maxWidth: 600,
      axisAlignment: 0.0,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
      elevation: 4.0,
      onQueryChanged: (query){
        //methodHere
      },
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      debounceDelay: const Duration(microseconds: 500),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(icon: const Icon(Icons.place),
              onPressed: (){
              print('Places Pressed');
              },),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        )
      ],

      builder: (context, transition) {
        return ClipRect(
          child: Material(
            color: Colors.white,
            child: Container(
              height: 200.0,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Ariana'),
                    subtitle: const Text('Selection du cette zone'),
                    onTap: () async {
                      destination = LatLng(arianaLocation.latitude, arianaLocation.longitude);
                      checkUpdatedLocation( arianaLocation);
                      GoogleMapController googleMapController = await _controller.future;
                      googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                          zoom: 15.5,
                          target: LatLng(
                            arianaLocation.latitude!,
                            arianaLocation.longitude!,
                          )
                      )));


                    },
                  ),

                   ListTile(
                    title: Text('La Marsa'),
                    subtitle: Text('Selection du cette zone'),
                     onTap: () async {
                      destination = LatLng(marsaLocation.latitude, marsaLocation.longitude);
                      checkUpdatedLocation( marsaLocation);
                       GoogleMapController googleMapController = await _controller.future;
                       googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                           zoom: 15.5,
                           target: LatLng(
                             marsaLocation.latitude!,
                             marsaLocation.longitude!,
                           )
                       )));
                     },
                  ),
                ],
              ),
            ),
          ),
        );
      },




    );
  }
}







