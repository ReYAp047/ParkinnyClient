import 'dart:async';
import 'package:parkinny/screen/order_traking_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_register_page.dart';

List<Vehicle> _vehicles = [];
TextEditingController _matGaucheController = TextEditingController();
TextEditingController _matDroiteController = TextEditingController();
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => WalletWidget();


}

//POP UP Add
class AddVehiclePopUp extends StatefulWidget {
  final void Function(String vehicleName, String vehicleType) onVehicleAdded;

  AddVehiclePopUp({required this.onVehicleAdded});
  @override
  _AddVehiclePopUpState createState() => _AddVehiclePopUpState();
}

class _AddVehiclePopUpState extends State<AddVehiclePopUp> {
  final _formKey = GlobalKey<FormState>();
  late String _matGauche;
  late String _matDroite;




  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Vehicle'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _matGaucheController,
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: const InputDecoration(labelText: 'Immatriculation à gauche'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer la immatriculation ';
                }
                return null;
              },
              onSaved: (value) => _matGauche = value!,
            ),
            TextFormField(
              controller: _matDroiteController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: const InputDecoration(labelText: 'Immatriculation à droite'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer la immatriculation';
                }
                return null;
              },
              onSaved: (value) => _matDroite = value!,
            ),
            const SizedBox(height: 16.0),
            FloatingActionButton.extended(
                label: const Text('Ajouter'),
              backgroundColor: const Color(0xFF6184FF),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Use the _matGauche and _matDroite variables to add the vehicle to your app's data
                  setState(() {
                    _vehicles.add(Vehicle(
                        matGauche: _matGaucheController.text,
                        matDroite: _matDroiteController.text
                    ));

                  });
                  Navigator.of(context).pop();

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
//END POP UP ADD

class WalletWidget extends State<WalletScreen> {
  String _text = "0";

  TextEditingController _textController = TextEditingController();
  late final String title;  final StreamController<List<Vehicle>> _vehiclesStreamController = StreamController<List<Vehicle>>();
  @override
  void dispose() {
    _vehiclesStreamController.close();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            const Text(
              "MaWallet",
              style: TextStyle(
                fontFamily: 'Outfit',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const Padding(padding: EdgeInsets.all(4)),
            Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 6,
                    color: Color(0x4B1A1F24),
                    offset: Offset(0, 2),
                  )
                ],
                gradient: const LinearGradient(
                  colors: [Color(0xFF6184FF), Color(0xFF3F5CC5)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0.94, -1),
                  end: AlignmentDirectional(-0.94, 1),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/LogoPw.png',
                            width: 44,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 32, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            'Dinars',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '$_text TND',
                            style: const TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '**** ****',
                            style: TextStyle(
                              fontFamily: 'Roboto Mono',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'foulen@gmail.com',
                            style: TextStyle(
                              fontFamily: 'Roboto Mono',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.0,

                  child: TextField(
                    obscureText: false,
                    controller: _textController,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),

                      labelText: 'Montant a recharger',
                    ),
                  ),
                ),

                // Generated code for this Button Widget...
                FloatingActionButton.extended(
                  onPressed: () {
                    setState(()  {
                      double deja = double.parse(_text);
                      double newValue = double.parse(_textController.text);
                      double tot = deja + newValue;
                      String text = tot.toString();
                      _text = text;
                      GlobalVariables.clientWallet = tot;


                    });
                  },
                  label: const Text('Recharger'),
                  backgroundColor: const Color(0xFF6184FF),


                )


              ],
            ),
            const Padding(padding: EdgeInsets.all(12)),
            Row(
              children: [
                const Text(
                  "Vehicle(s)",
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AddVehiclePopUp(
                        onVehicleAdded: (vehicleMatGauche, vehicleMatDroite) {
                          // Add the new vehicle to the list
                          setState(() {
                           // _vehicles.add(Vehicle(matGauche: vehicleMatGauche, matDroite: vehicleMatDroite));
                            //_vehiclesStreamController.add(_vehicles);
                          });

                        },
                      ),
                      );
                    },
                  ),



              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Expanded(
              child: ListView.builder(
                itemCount: _vehicles.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Image.network(
                          'https://res.cloudinary.com/dhncrtnjp/image/upload/v1670186771/Hybrid_car-rafiki_2_mmo02i.png',
                          width: 80,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        const Spacer(),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              _vehicles[index].matGauche,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ),
                        const Spacer(),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const TextField(
                            enabled: false,
                            obscureText: true,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              label: Center(
                                child: Text("تونس", style: TextStyle(color: Colors.white),),
                              ),

                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              _vehicles[index].matDroite,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ),
                        const Spacer(),
                         IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              _vehicles.removeAt(index);
                              _vehiclesStreamController.add(_vehicles);
                            });
                          },
                        )
                      ],

                    ),
                  );

                  /*ListTile(
                          title: Text(_vehicles[index].matGauche),
                          subtitle: Text(_vehicles[index].matDroite),
                        );
                        */
                },
              ),
            ),

            const Padding(padding: EdgeInsets.all(20)),




            /*
            Row(
              children: [
                Image.network(
                  'https://res.cloudinary.com/dhncrtnjp/image/upload/v1670188203/Secure_login-bro_1_m815oo.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const Spacer(),
                Column(
                  children: [
                    SizedBox(
                      width: 200.0,
                      height: 40.0,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),

                          labelText: 'Mots de passe',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(6)),
                    SizedBox(
                      width: 200.0,
                      height: 40.0,

                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),

                          labelText: 'Nouveau mots de passe',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(7)),

                    FloatingActionButton.extended(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      label: const Text('Enregistrer'),
                      backgroundColor: const Color(0xFF6184FF),
                    )
                  ],
                )
              ],
            )*/


          ],
        ),
      ),


    );

  }
}


class Vehicle {
  final String matGauche;
  final String matDroite;

  Vehicle({required this.matGauche, required this.matDroite});
}


