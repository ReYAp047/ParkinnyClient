import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Reservation {
  String address;
  String date;
  String time;
  double price;
  String matricule;

  Reservation({
    required this.address,
    required this.date,
    required this.time,
    required this.price,
    required this.matricule,
  });
}

class GlobalVariables {
  static String clientEmail = '';
  static double clientWallet = 0;
  static List<Reservation> reservations = [];

}

class VehicleClass {
   String matGauche;
   String matDroite;

  VehicleClass({required this.matGauche, required this.matDroite});
}
class GlobalVehicle {
  static List<VehicleClass> Vehicules = [];

}


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      GlobalVariables.clientEmail = _controllerEmail.text;
      GlobalVariables.clientWallet = 0;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      await Supabase.instance.client
          .from('clientProfile_clientprofile')
          .insert({'Nom_Client':"",'Email':_controllerEmail.text, 'Telephone':'', 'Solde_wallet':0});
      GlobalVariables.clientEmail = _controllerEmail.text;
      GlobalVariables.clientWallet = 0;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _entryField(String title,
      TextEditingController controller,) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3F5CC5),

      ),
      onPressed:
      isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? '          Se connecter          ' : '        Créer compte        '),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Pas de compte?' : 'J\'ai un compte  '),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            const Padding(padding: EdgeInsets.all(15)),
            const Text(
              'Créer & connecter a votre compte',
              style: TextStyle(
                fontFamily: 'Roboto Mono',
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Image.network(
              'https://res.cloudinary.com/dhncrtnjp/image/upload/v1670396482/Privacy_policy-rafiki_2_zcvwwu.png',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            _entryField('email', _controllerEmail),
            _entryField('password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),

          ],
        ),
      ),
    );
  }
}