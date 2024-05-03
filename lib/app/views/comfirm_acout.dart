import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class ComfirmAcount extends StatefulWidget {
  const ComfirmAcount({super.key});

  @override
  State<ComfirmAcount> createState() => _ComfirmAcount();
}

class _ComfirmAcount extends State<ComfirmAcount> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black.withOpacity(0.5)),
      ),
    );

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Por seguridad, confirme su cuenta!",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 34)),
                      Text(
                        "Enviaremos un mensaje de texto a su celular con un codigo de confirmacion para su cuenta",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      Pinput(
                        defaultPinTheme: defaultPinTheme,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      Text(
                        "Codigo de seguridad",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      buttonCustom("Guardar"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonCustom(String text) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 6,
            child: FilledButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  title: 'Te has registrado con exicto',
                  confirmBtnText: 'Aceptar',
                  confirmBtnColor: Theme.of(context).primaryColor,
                );
              },
              child: Text(text),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
