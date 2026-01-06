import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuafor_randevu_takip_uygulamasi/customer/widgets/create_new_meeting.dart';
import 'package:kuafor_randevu_takip_uygulamasi/customer/widgets/greeting_header.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Premium Renk Paleti (Slate & Electric Indigo)
    const Color bgPrimary = Color(0xFF020617); // Çok derin gece mavisi
    const Color cardBg = Color(0xFF1E293B);    // Slate kart rengi
    const Color electricIndigo = Color(0xFF6366F1); // Ana vurgu rengi (Modern Mor/Mavi)
    const Color iceBlue = Color(0xFF94A3B8);   // İkincil metin ve ikon rengi

    return Scaffold(
      backgroundColor: bgPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Roni Berber Artist", style: GoogleFonts.lexend(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: -0.5,),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: electricIndigo.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications_active_outlined, color: electricIndigo),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [cardBg, cardBg.withOpacity(0.5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                child: const GreetingHeader(name: "Alvin"),
              ),

              const SizedBox(height: 25),

              const CreateNewMeeting(),

              const SizedBox(height: 35),

              // Hizmetler Başlık
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Servis Seçimi",
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Hepsini Gör",
                    style: GoogleFonts.lexend(
                      color: electricIndigo,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Örnek bir Hizmet Kartı yapısı (Görseldeki gibi 3'lü dizilim için fikir verir)
              Row(
                children: [
                  _buildMiniCard(Icons.content_cut, "Saç", electricIndigo),
                  const SizedBox(width: 15),
                  _buildMiniCard(Icons.face, "Sakal", Colors.cyanAccent),
                  const SizedBox(width: 15),
                  _buildMiniCard(Icons.auto_awesome, "Bakım", Colors.purpleAccent),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hizmetler için hızlıca kullanabileceğin şık bir yardımcı widget
  Widget _buildMiniCard(IconData icon, String title, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}