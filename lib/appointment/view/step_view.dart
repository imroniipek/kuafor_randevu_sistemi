import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/widget/steps_widget.dart';
class StepView extends StatefulWidget {
  const StepView({super.key});

  @override
  State<StepView> createState() => _StepViewState();
}

class _StepViewState extends State<StepView> {
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
            backgroundColor: Colors.black87,
          appBar:  AppBar(backgroundColor: Colors.transparent,
          title: Text("Randevu Oluştur", style: GoogleFonts.lexend(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),),
            centerTitle: true,
         ),
          body:
          StepsWidget()

        );
  }
}
