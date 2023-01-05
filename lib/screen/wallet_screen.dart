import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => WalletWidget();


}



class WalletWidget extends State<WalletScreen> {

  @override
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
                        children: const [
                          Text(
                            '7,630 TND',
                            style: TextStyle(
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
                    obscureText: true,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),

                      labelText: '10',
                    ),
                  ),
                ),

                // Generated code for this Button Widget...
                FloatingActionButton.extended(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  label: const Text('Recharger'),
                  backgroundColor: const Color(0xFF6184FF),


                )


              ],
            ),
            const Padding(padding: EdgeInsets.all(12)),
            Row(
              children: const [
                Text(
                  "Vehicule(s)",
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                )

              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
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
                  child: const TextField(
                    obscureText: true,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      label: Center(
                        child: Text("247"),
                      ),

                    ),
                  ),
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
                  child: const TextField(
                    obscureText: true,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      label: Center(
                        child: Text("9999"),
                      ),

                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.save_as_outlined,
                  color: Colors.black,
                )
              ],
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


