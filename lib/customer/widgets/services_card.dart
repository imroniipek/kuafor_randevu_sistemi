import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuafor_randevu_takip_uygulamasi/Models/extensions/service_extension.dart';
import 'package:kuafor_randevu_takip_uygulamasi/Models/service_model.dart';

class ServicesCard extends StatelessWidget {
  final ServiceModel model;

  const ServicesCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: MediaQuery.sizeOf(context).width/3,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: model.color.withOpacity(0.5), width: 3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: model.color.withOpacity(0.01),
                shape: BoxShape.circle,
              ),
              child: model.returnTheIconData(),
            ),
            const SizedBox(height: 12),

            Text(model.name, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.lexend(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500,),),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.monetization_on_outlined, color: Colors.white70, size: 20),
                const SizedBox(width: 4),
                Text("${model.price} TL", style: GoogleFonts.lexend(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400,),
                ),
              ],
            ),

            const SizedBox(height: 4),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.access_time, color: Colors.white70, size: 25),
                const SizedBox(width: 4),
                Text("${model.duration} dk", style: GoogleFonts.lexend(color: Colors.white60, fontSize: 20,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}