import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:parkinny/widget_tree.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  static const customBlue =  Color(0xFF3F5CC5);

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () {
          // print('skipped');
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
            //print("done")
        },
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontSize: 16,
          color: Colors.brown.shade300,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.blue,
          activeColor: customBlue,
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WidgetTree()),
            );
          },
          child: const Text(
            "Ignorer",
            style: TextStyle(color: customBlue),
          ),
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state, context),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Colors.blueAccent, customBlue],
                  ),
                ),
                child: Text(
                  state.isLastPage ? "Se connecter" : "Suivant",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState, BuildContext context) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,

      );

    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WidgetTree()),
      );
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "B I E N V E N U E !",
    description: "Rejoignez-nous & payez votre place facilement",
    imgUrl: "assets/hello.png",
  ),
  const OnBoardModel(
    title: "P H O N E - P A Y",
    description:
    "Payez votre réservation via wallet",
    imgUrl: 'assets/E-Wallet-bro.png',
  ),
  const OnBoardModel(
    title: "P A R K I N N Y",
    description:
    "Trouvez tous les parkings publics via maps",
    imgUrl: 'assets/Order ride-amico.png',
  ),
];