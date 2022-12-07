import 'package:flutter/material.dart';

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
            const Padding(padding: EdgeInsets.all(4)),
            SizedBox(
              width: 500.0,
              height: 40.0,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelText: 'Recherche',
                  prefixIcon: const Icon(Icons.search_sharp),

                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(16)),
            Row(
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
                        children: const [
                          Text(
                            "247TN9999 ",
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "11:00 AM",
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "   2471, Rue de Irak, La Fayette",
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
                const Spacer(),
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
                        children: const [
                          Text(
                            "06/12/2022 ",
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "3 heurs - 9DT",
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
            ),
            const Padding(padding: EdgeInsets.all(6)),
            Row(
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
                        children: const [
                          Text(
                            "247TN9999 ",
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "11:00 AM",
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "   2471, Rue de Irak, La Fayette",
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
                const Spacer(),
                Image.network(
                  'https://res.cloudinary.com/dhncrtnjp/image/upload/v1670394930/time_clock_icon_145885_1_4_nolun7.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child:  Row(
                        children: const [
                          Text(
                            "06/12/2022 ",
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "3 heurs - 9DT",
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
            ),
            const Padding(padding: EdgeInsets.all(6)),
            Row(
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
                        children: const [
                          Text(
                            "247TN9999 ",
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "11:00 AM",
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "   2471, Rue de Irak, La Fayette",
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
                const Spacer(),
                Image.network(
                  'https://res.cloudinary.com/dhncrtnjp/image/upload/v1670394930/time_clock_icon_145885_1_4_nolun7.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child:  Row(
                        children: const [
                          Text(
                            "06/12/2022 ",
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "3 heurs - 9DT",
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
            ),
            const Padding(padding: EdgeInsets.all(6)),
            Row(
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
                        children: const [
                          Text(
                            "247TN9999 ",
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "11:00 AM",
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "   2471, Rue de Irak, La Fayette",
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
                const Spacer(),
                Image.network(
                  'https://res.cloudinary.com/dhncrtnjp/image/upload/v1670394930/time_clock_icon_145885_1_4_nolun7.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child:  Row(
                        children: const [
                          Text(
                            "06/12/2022 ",
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "3 heurs - 9DT",
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
            ),
            const Padding(padding: EdgeInsets.all(6)),
            Row(
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
                        children: const [
                          Text(
                            "247TN9999 ",
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "11:00 AM",
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "   2471, Rue de Irak, La Fayette",
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
                const Spacer(),
                Image.network(
                  'https://res.cloudinary.com/dhncrtnjp/image/upload/v1670394930/time_clock_icon_145885_1_4_nolun7.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child:  Row(
                        children: const [
                          Text(
                            "06/12/2022 ",
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "3 heurs - 9DT",
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
            ),

          ],
        ),



    ),

      ),





    );

  }
}


