import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuafor_randevu_takip_uygulamasi/customer/bloc/bloc/customer_bloc.dart';
import 'package:kuafor_randevu_takip_uygulamasi/customer/bloc/events/customer_event.dart';
import 'package:kuafor_randevu_takip_uygulamasi/customer/widgets/create_new_meeting.dart';
import 'package:kuafor_randevu_takip_uygulamasi/customer/widgets/greeting_header.dart';
import 'package:kuafor_randevu_takip_uygulamasi/customer/widgets/services_card.dart';
import '../bloc/status/customer_status.dart';
class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {

  @override
  void initState()
  {
    super.initState();
    context.read<CustomerBloc>().add(getAllOfServicesFromDb());
  }
  @override
  Widget build(BuildContext context) {
    const Color cardBg = Color(0xFF1E293B);
    const Color electricIndigo = Color(0xFF6366F1);

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Roni Berber Artist", style: GoogleFonts.lexend(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: -0.5,),),
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
      body:
         BlocBuilder<CustomerBloc,CustomerStatus>(
           builder: (context,state)
             {
               if(state.status==PageStatus.success)
                 {
                   return SingleChildScrollView(
                     physics: const BouncingScrollPhysics(),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
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
                             ),
                             child: const GreetingHeader(name: "Alvin"),
                           ),

                           const SizedBox(height: 25),

                           const CreateNewMeeting(),

                           const SizedBox(height: 25),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Servis Seçimi", style: GoogleFonts.lexend(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500,),),
                               Text("Hepsini Gör", style: GoogleFonts.lexend(color: electricIndigo, fontSize: 14, fontWeight: FontWeight.w400,),),
                             ],
                           ),
                           const SizedBox(height: 25),
                           SizedBox(
                             height: MediaQuery.sizeOf(context).height/4,
                             child: ListView.builder(
                               shrinkWrap: true,
                               scrollDirection: Axis.horizontal,
                               itemCount:state.models.length ,
                               itemBuilder:(context,index)
                                 {
                                   return ServicesCard(model:state.models[index]);
                                 }
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                 }
               else if(state.status==PageStatus.error)
               {
                 return Center(child:Text("Database Service Elemanları Bulunamadı"));
               }
               else
                 {
                   return Center(child:CircularProgressIndicator());
                 }
             },
         ),
      );
  }
}