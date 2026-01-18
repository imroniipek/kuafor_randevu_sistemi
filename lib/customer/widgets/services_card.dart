import 'dart:ui';
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
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
      width: MediaQuery.sizeOf(context).width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            model.color.withOpacity(0.15),
            model.color.withOpacity(0.05),
          ],
        ),
        border: Border.all(color: model.color.withOpacity(0.3), width: 1.5,),
        boxShadow: [BoxShadow(color: model.color.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4),),],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: model.color.withOpacity(0.2),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: model.color.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ]
                  ),
                  child: Icon(model.returnTheIconData().icon, color: model.color, size: 30,),),
                const SizedBox(height: 15),

                Text(model.name, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.lexend(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400,),),
                const SizedBox(height: 5),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12),),
                  child: Text("${model.price} ₺", style: GoogleFonts.lexend(color: model.color.withOpacity(0.9), fontSize: 14, fontWeight: FontWeight.bold,),
                  ),
                ),

                const SizedBox(height: 5),

                Container(




                )





              ],
            ),
          ),
        ),
      ),
    );
  }
}