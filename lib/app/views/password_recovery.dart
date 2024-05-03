import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecovery();
}

class _PasswordRecovery extends State<PasswordRecovery> {
  late String email, password;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();


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
                  title: const Text('Recuperar contraseña'),
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
                        "Ingrese su cuenta de correo electronico para recuperar contraseña",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 34)),
                      buildEmail(),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      Text(
                        "Despues de validar tu cuenta , ingresa nueva contraseña ",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      buildPassword(),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      buttonCustom("Continuar"),
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
                  title: '¡Tu contraseña ha sido actualizada!',
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

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Padding(padding: EdgeInsets.only(top: 12)),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.mail_outlined),
            labelText: "Ingresa correo electronico",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.black)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Este campo es obligatorio";
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
          onSaved: (String? value) {
            email = value!;
          },
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contraseña",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Padding(padding: EdgeInsets.only(top: 12)),
          TextFormField(
            controller: _password,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Empty';
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_open),
              labelText: "Ingresa contraseña",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.black)),
            ),
            obscureText: true,
            onSaved: (String? value) {
              password = value!;
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 12)),
          Text(
            "Confirmar contraseña",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Padding(padding: EdgeInsets.only(top: 12)),
          TextFormField(
            controller: _confirmPassword,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Empty';
              }
              if (val != _password.text) {
                return 'Not Match';
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_open),
              labelText: "Ingresa contraseña",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.black)),
            ),
            obscureText: true,
            onSaved: (String? value) {
              password = value!;
            },
          ),
        ],
      ),
    );
  }


}