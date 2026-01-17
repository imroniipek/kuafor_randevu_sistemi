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
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Roni Berber Artist", style: GoogleFonts.lexend(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: -0.5,),),
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
                           const SizedBox(height: 15),

                           const GreetingHeader(name: "Fatih"),

                           const SizedBox(height: 30),

                           const CreateNewMeeting(),

                           const SizedBox(height: 25),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Servis Seçimi", style: GoogleFonts.lexend(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500,),),
                               Text("Hepsini Gör", style: GoogleFonts.lexend(color: Colors.deepPurpleAccent, fontSize: 14, fontWeight: FontWeight.w400,),),
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
                 return Center(child:Text("Service Elemanları Bulunamadı"));
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