import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:parkinny/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as map_tool;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
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

      List<map_tool.LatLng> convertedPolygonPoints = polygonPoints.map(
              (point) => map_tool.LatLng(point.latitude,point.longitude)
      ).toList();
      isSelectedArea = map_tool.PolygonUtil.containsLocation(
          map_tool.LatLng(pointLatLng.latitude, pointLatLng.longitude),
          convertedPolygonPoints,
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
   /* result.points.forEach(
            (PointLatLng point)=>polylinecordinates.add(
            LatLng(point.latitude, point.longitude)
        )
    );*/
    setState(() {});
  }
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
                strokeWidth: 4,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("6"),
                points: zone6,
                strokeWidth: 4,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("7"),
                points: zone7,
                strokeWidth: 4,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
              ),
              Polygon(
                polygonId: const PolygonId("8"),
                points: zone8,
                strokeWidth: 4,
                strokeColor: const Color(0xFF006491),
                fillColor: const Color(0xFF006491),
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
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 7, minute: 15),
    );
    if(newTime != null){
      final now = DateTime.now();


      DateTime t = DateTime(now.year, now.month, now.day, newTime.hour, newTime.minute);
      final difference = t.difference(now);
      String time = "${now.hour}:${now.minute}";
      String timeUntil = "${newTime.hour}:${newTime.minute}";

      String formattedMsgDate = "De: $time";
      String formattedMsgNewTime = "À: $timeUntil";
      int diff = difference.inHours.toInt()+1;
      String formattedTime = "Dureé: $diff heurs";
      int total = diff * 3;
      String formattedPriceMsg = "Total a payer: $total DINAR";

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Validation du réservation'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(formattedMsgDate),
                    Text(formattedMsgNewTime),
                    Text(formattedTime),
                    Text(formattedPriceMsg)
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







