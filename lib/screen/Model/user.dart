import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:parkinny/screen/login_register_page.dart';

class User {

  final String email;

  User({required this.email});

  Future<void> addSolde(double tot, String email) async {
    await Supabase.instance.client
        .from('clientProfile_clientprofile')
        .update({'Solde_wallet': tot})
        .eq('Email', email)
        .execute();

  }

   Future<int> getSole(String email) async {
    SupabaseClient client = Supabase.instance.client;
    PostgrestResponse response = await client
        .from('clientProfile_clientprofile')
        .select('Solde_wallet')
        .eq('Email', email)
        .execute();
    if (response.data == null) {
      GlobalVariables.clientWallet = 0;
      return 0;
    } else {
      // get the Solde_wallet value from the response
      List<dynamic> data = response.data;
      if (data.isNotEmpty) {
        double soldeWallet = data[0]['Solde_wallet'];
        GlobalVariables.clientWallet = soldeWallet;
        print('Solde_wallet: $soldeWallet');
        return 0;
      } else {
        GlobalVariables.clientWallet = 22;
        return 0;
      }
    }

  }


  Future<void> addReservation(String email, String address, String date, String time, double price, String mat, String formattedMsgNewTime, String formattedMsgDate) async {
    await Supabase.instance.client
        .from('reservation_reservation')
        .insert({'Nom_Client':'', 'Email':email, 'Telephone':00000000, 'Prix_payer':price, 'Date':date, 'Matricule':mat, 'Nombre_heurs': time, 'Adresse': address, 'Date_Sortie':formattedMsgNewTime, 'Date_Entrer':formattedMsgDate});

  }


}