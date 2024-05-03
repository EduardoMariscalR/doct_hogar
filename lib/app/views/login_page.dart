import 'package:doct_hogar/app/views/login1_screen.dart';
import 'package:doct_hogar/app/components/onboarding_facebook.dart';
import 'package:doct_hogar/app/components/onboarding_google.dart';
import 'package:doct_hogar/app/views/password_recovery.dart';
import 'package:doct_hogar/app/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: waveAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleAuthentication(),
                    FacebookAuthentication()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: formulario(),
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                buttonLogin("Iniciar secion"),
                const Padding(padding: EdgeInsets.only(top: 50)),
                 Text(
                  "¿Aun no tienes una cuenta?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                buttonRegister("Registrarse"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formulario() {
    return Form(
      child: Column(
        key: _formKey,
        children: [
           Text("O ingresa a tu cuenta con",
              style: Theme.of(context).textTheme.titleLarge),
          const Padding(padding: EdgeInsets.only(top: 24)),
          buildEmail(),
          const Padding(padding: EdgeInsets.only(top: 12)),
          buildPassword(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contraseña",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Padding(padding: EdgeInsets.only(top: 12)),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_open),
            labelText: "Ingresa contraseña",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.black)),
          ),
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return "Este campo es obligatorio";
            }
            return null;
          },
          onSaved: (String? value) {
            password = value!;
          },
        ),
        const Padding(padding: EdgeInsets.only(top: 12)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap:() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PasswordRecovery()));
              },
              child: Text(
                "Recuperar contraseña",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buttonLogin(String text) {
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LolgIn1Screen()));
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

  Widget buttonRegister(String text) {
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
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
            title: const Text('ingresa con'),
          ),
                      ],
                    ),
        ),
      ),
    );
  }
}
