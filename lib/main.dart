import 'package:doct_hogar/app/views/login1_screen.dart';
import 'package:doct_hogar/app/views/login_page.dart';
import 'package:doct_hogar/app/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DoctHogar',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: GoogleFonts.poppins().fontFamily),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(2, 166, 167, 1)),
        useMaterial3: true,
      ), 
      routes: {
        '/':(context) => const LogInScreen(),
        '/login1':(context) => const LolgIn1Screen(),
        '/loginpage':(context) => const LoginPage()
      },
    );
  }
}

