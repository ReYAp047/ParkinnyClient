import 'package:flutter/material.dart';
import 'login_register_page.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => HistoryWidget();


}

class HistoryWidget extends State<HistoryScreen> {

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:  [
              const Text(
                "Historique",
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const Padding(padding: EdgeInsets.all(16)),
              Expanded(
                child: ListView.separated(
                  itemCount: GlobalVariables.reservations.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 6),
                  itemBuilder: (context, index) {
                    final reservation = GlobalVariables.reservations[index];
                    return buildReservationCard(reservation);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildReservationCard(Reservation reservation) {
    return Row(
      children: [
        Image.network(
          'https://res.cloudinary.com/dhncrtnjp/image/upload/v1670366638/Group_52_x5buvp.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child:  Row(
                children: [
                  Text(
                    reservation.matricule,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              reservation.address,
              style: TextStyle(
                fontFamily: 'Outfit',
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Spacer(),
        Image.network(
          'https://res.cloudinary.com/dhncrtnjp/image/upload/v1670368261/time_clock_icon_145885_1_3_wk0pd1.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child:  Row(
                children: [
                  Text(
                    reservation.date,
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "${reservation.time} - ${reservation.price}DT",
              style: TextStyle(
                fontFamily: 'Outfit',
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ],
    );
  }
}


