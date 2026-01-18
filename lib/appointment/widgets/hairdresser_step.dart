import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/bloc/appointment_event.dart';
import 'package:kuafor_randevu_takip_uygulamasi/core/consts.dart';
import '../bloc/appointment_bloc.dart';
import '../bloc/appointment_status.dart';
class HairdresserStep extends StatelessWidget {
  const HairdresserStep({super.key});
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<AppointmentBloc,AppointmentStatus>(

           buildWhen:(p,c)=> p.date!=c.date||p.status!=c.status,
            builder: (context,state)
            {
              return
                  Container(
                      decoration: BoxDecoration(
                        border:Border.all(color:Consts.primaryColor,width: 2.5),
                        borderRadius: BorderRadius.circular(20),
                        color:Colors.black87,
                        boxShadow: [
                          BoxShadow(
                            color:Consts.primaryColor,
                            blurRadius: 5,
                            offset:const Offset(0,2),
                        )],
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                      child:Center(
                        child: ListTile(
                          title:Text(state.date,style:GoogleFonts.lexend(color: Colors.white, fontSize:Consts.getTheScreenSize(context), fontWeight: FontWeight.w600)),
                          leading:Icon(Icons.calendar_today,size:25,color:Colors.white),
                          onTap: ()
                          async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate:DateTime.now(),
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2030),
                            );
                            if(picked!.isBefore(DateTime.now()))
                              {
                                context.read<AppointmentBloc>().add(ChooseTheDate(date: picked));
                              }
                          },
                        ),
                      )

                );}
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Kuaför Seçimi:",style:GoogleFonts.lexend(color: Colors.white, fontSize:Consts.getTheScreenSize(context), fontWeight: FontWeight.w600)),
        ),






      ],
    );
  }
}
