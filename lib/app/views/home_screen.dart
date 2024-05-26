import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: waveAppBar(),
      body: Stack(
        children: [
          Image.asset(
            'assets/home.png',
            fit: BoxFit.none,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomAppBar(
          color: Color.fromARGB(255, 2, 167, 167),
          // shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.location_pin),
                  color: Color.fromARGB(255, 32, 130, 131),
                  onPressed: () {},
                ),
              ),
              Spacer(),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.medical_services),
                  color: Color.fromARGB(255, 32, 130, 131),
                  onPressed: () {},
                ),
              ),
              Spacer(),
              Spacer(),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.text_snippet),
                  color: Color.fromARGB(255, 32, 130, 131),
                  onPressed: () {},
                ),
              ),
              Spacer(),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.account_circle_rounded),
                  color: Color.fromARGB(255, 32, 130, 131),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: Ink(
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 2, 167, 167),
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.my_location),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSize waveAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Container(
        color: Theme.of(context).primaryColor,
        width: MediaQuery.of(context).size.width,
        // Set Appbar wave height
        child: Container(
          height: 120,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            children: <Widget>[
              RotatedBox(
                  quarterTurns: 2,
                  child: WaveWidget(
                    config: CustomConfig(
                      colors: [
                        Theme.of(context).primaryColor.withAlpha(100),
                        Theme.of(context).primaryColor.withAlpha(150),
                        Theme.of(context).primaryColor.withAlpha(200),
                        Theme.of(context).primaryColor.withAlpha(250),
                      ],
                      durations: [35000, 19440, 10800, 6000],
                      heightPercentages: [0.0, 0.06, 0.10, 0.20],
                    ),
                    size: const Size(double.infinity, double.infinity),
                    waveAmplitude: 1,
                  )),
              AppBar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {},
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
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
