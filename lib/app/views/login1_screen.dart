import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LolgIn1Screen extends StatelessWidget {
  const LolgIn1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            // Set Appbar wave height
            child: Container(
          height: 120,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Container(
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
                    title: const Text('ingresa con'),
                  ),
                ],
              )),
            ),
          ),
        ),
        body: const Column(
          children: [
            Row(
            
            )
          ],
        ),
    );
  }
}

