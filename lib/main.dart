import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/bloc/appointment_bloc.dart';
import 'package:kuafor_randevu_takip_uygulamasi/customer/bloc/bloc/customer_bloc.dart';
import 'package:kuafor_randevu_takip_uygulamasi/customer/view/customer_page.dart';
import 'package:kuafor_randevu_takip_uygulamasi/dbbloc/db_bloc.dart';
import 'package:kuafor_randevu_takip_uygulamasi/locator.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(

      MultiBlocProvider(
          providers: [
            BlocProvider(create:(_)=>CustomerBloc()),
            BlocProvider(create: (_)=>AppointmentBloc()),
            BlocProvider(create: (_)=>DbBloc())
          ],
          child:  const MyApp(),
          )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CustomerPage()
    );
  }
}
