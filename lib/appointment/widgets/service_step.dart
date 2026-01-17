import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuafor_randevu_takip_uygulamasi/Models/extensions/service_extension.dart';
import '../../Models/service_model.dart';
import '../bloc/appointment_bloc.dart';
import '../bloc/appointment_event.dart';

class ServiceStep extends StatelessWidget {
  final List<ServiceModel> services;
  const ServiceStep({super.key, required this.services});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    final selectedServices = context.watch<AppointmentBloc>().state.services;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final model = services[index];
        final bool isSelected = selectedServices.contains(model);

        return servicesContainer(model, isSelected, context, width);
      },
    );
  }
}

Widget servicesContainer(ServiceModel model, bool isSelected, BuildContext context, double screenWidth) {
  double dynamicFontSize = screenWidth * 0.050;
  double iconSize = screenWidth * 0.07;

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          model.color.withOpacity(isSelected ? 0.3 : 0.1),
          model.color.withOpacity(isSelected ? 0.15 : 0.05),
        ],
      ),
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: model.color.withOpacity(isSelected ? 1.0 : 0.3), width: 2),
    ),
    child: ListTile(

      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: 5),

      leading: Container(
        width: screenWidth * 0.12,
        height: screenWidth * 0.12,
        decoration: BoxDecoration(color: model.color.withOpacity(0.2), shape: BoxShape.circle,),
        child: Icon(model.returnTheIconData().icon, color: model.color, size: iconSize),
      ),

      title: Text(model.name, style: GoogleFonts.lexend(color: Colors.white, fontSize: dynamicFontSize)),

      subtitle: Text("${model.duration} dk", style: GoogleFonts.lexend(color: model.color, fontSize: dynamicFontSize * 0.8)),

      trailing: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text("${model.price} ₺", style: GoogleFonts.lexend(color: Colors.white, fontSize: dynamicFontSize * 0.9, fontWeight: FontWeight.bold)),
          IconButton(
            onPressed: () {
              if (isSelected) {
                context.read<AppointmentBloc>().add(RemoveServiceForAppoinmentList(id: model.id));
              } else {
                context.read<AppointmentBloc>().add(AddServiceForAppointment(service: model));
              }
            },
            icon: Icon(isSelected ? Icons.check_box : Icons.check_box_outline_blank_outlined, size: iconSize * 1.2, color: isSelected ? Colors.green : Colors.white,),
          ),
        ],
      ),
    ),
  );
}