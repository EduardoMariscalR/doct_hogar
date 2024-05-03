import 'package:doct_hogar/app/views/comfirm_acout.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String name, firstLastName, secondLastName, phone, email, password;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _firstLastName = TextEditingController();
  final TextEditingController _secondLastName = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  bool? isChecked = false;

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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: formulario(),
                ),
              ],
            ),
          ),
        ),
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
                title: const Text('Confirmacion cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget formulario() {
    return Form(
      child: Column(
        children: [
          Text(
            "¡Te damos la bienvenida!",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Padding(padding: EdgeInsets.only(top: 24)),
          buildName(),
          const Padding(padding: EdgeInsets.only(top: 24)),
          buildEmail(),
          const Padding(padding: EdgeInsets.only(top: 24)),
          buildPhone(),
          const Padding(padding: EdgeInsets.only(top: 32)),
          Text(
            "Seguridad",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Padding(padding: EdgeInsets.only(top: 24)),
          buildPassword(),
          const Padding(padding: EdgeInsets.only(top: 24)),
          tyc(),
          const Padding(padding: EdgeInsets.only(top: 24)),
          buttonCustom("Continuar", const ComfirmAcount()),
        ],
      ),
    );
  }

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nombre completo",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Padding(padding: EdgeInsets.only(top: 12)),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Ingresa tu nombre",
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
          keyboardType: TextInputType.name,
          onSaved: (String? value) {
            name = value!;
          },
        ),
      ],
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

  Widget buildPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Celular",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Padding(padding: EdgeInsets.only(top: 12)),
        PhoneFormField(
          initialValue: PhoneNumber.parse('+52'),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.phone),
            labelText: "Ingresa tu numero",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.black)),
          ),
          validator: _getValidator(context),
        )
      ],
    );
  }

  PhoneNumberInputValidator? _getValidator(BuildContext context) {
    List<PhoneNumberInputValidator> validators = [];
    validators.add(
        PhoneValidator.validMobile(context, errorText: "Numero no valido"));
    return validators.isNotEmpty ? PhoneValidator.compose(validators) : null;
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

  Widget tyc() {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (newBool) {
            setState(() {
              isChecked = newBool;
            });
          },
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.confirm,
                text:
                    'unque la frase no tiene sentido, tiene una larga historia. Durante varios siglos, los tipógrafos han utilizado esta frase para mostrar las características más distintivas de sus fuentes. Se utiliza porque las letras que contiene y el espaciado entre caracteres de esas combinaciones revelan de la mejor forma posible el espesor, el diseño y otras características importantes del tipo de letra.',
                title: 'Terminos y condiciones',
                confirmBtnText: 'Aceptar',
                cancelBtnText: 'Cancelar',
                confirmBtnColor: Colors.green,
              );
            },
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.titleSmall,
                children: [
                  const TextSpan(text: 'He leido y estoy de acuerdo con los'),
                  TextSpan(
                    text: ' Terminos y Condiciones',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const TextSpan(
                      text: ' y la politica de tratamiento de datos'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonCustom(String text, Widget navigateTo) {
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
                    builder: (context) => navigateTo));
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
