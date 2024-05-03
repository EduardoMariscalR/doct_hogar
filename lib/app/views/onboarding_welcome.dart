import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Welcome extends StatefulWidget {
  final String photoURL;
  final String displayName;
  final String email;
  const Welcome(
      {required this.photoURL,
      required this.displayName,
      required this.email,
      super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: waveAppBar(),
      body: Center(
        child: Column(
          children: [
            (widget.photoURL.isEmpty)
                ? const SizedBox(
                    width: 100,
                    child: Placeholder(
                      fallbackHeight: 100,
                    ),
                  )
                : ClipRRect(
                    child: Image.network(widget.photoURL),
                  ),
            Text(
              widget.displayName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              widget.email,
              style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 2, 167, 167),
        shape: CircularNotchedRectangle(),
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
                actions: [TextButton(onPressed: () {}, child: const Text("Sing out"))],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
