import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingHeader extends StatelessWidget {
  final String name;

  const GreetingHeader({super.key, required this.name,});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width:double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF16161A),
          borderRadius: BorderRadius.circular(18),
          border:Border.all(color:Colors.white)
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Merhaba, $name", style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w600, color: Color(0xFFEAEAEA),),),
            const SizedBox(height: 6),
            Text("Kişisel Bakım Zamanı", style: GoogleFonts.poppins(fontSize: 20, color: Color(0xFF9CA3AF),),),
          ],
        ),
      );
  }
}
