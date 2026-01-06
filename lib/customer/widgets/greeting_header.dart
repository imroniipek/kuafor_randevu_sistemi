import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingHeader extends StatelessWidget {
  final String name;

  const GreetingHeader({super.key, required this.name,});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          color: const Color(0xFF16161A),
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Merhaba, Alvin", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFFEAEAEA),),),
            const SizedBox(height: 6),
            Text("Kişisel Bakım Zamanı", style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF9CA3AF),),),
          ],
        ),
      );



  }
}
