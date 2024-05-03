import 'package:doct_hogar/app/views/login_page.dart';
import 'package:doct_hogar/app/views/register_screen.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/bg_login.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Image.asset(
                  'assets/docthogar_logo.png',
                  fit: BoxFit.scaleDown,
                  height: 240,
                  width: 240,
                ),
                const Spacer(
                  flex: 3,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Spacer(flex: 1,),
                      Expanded(
                        flex: 2,
                        child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> const LoginPage())
                            );
                          },
                          child: const Text('Iniciar sesion'),
                        ),
                      ),
                      const Spacer(flex: 1,),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Spacer(flex: 1,),
                      Expanded(
                        flex: 2,
                        child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> const RegisterScreen())
                            );
                          },
                          child: const Text('Registrarse'),
                        ),
                      ),
                      const Spacer(flex: 1,),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
