import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/view/step_indicator.dart';
class CreateNewMeeting extends StatelessWidget {
  const CreateNewMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
          color:Color(0xFF1E293B),),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: ()
          {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>AppointmentPage()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(Icons.calendar_today_rounded, color: Colors.white, size: 25),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Randevu Al", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white,),),
                      const SizedBox(height: 5),
                      Text("Hemen randevu al ve Tarzını Konuştur", style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withOpacity(0.85),),),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 35,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
