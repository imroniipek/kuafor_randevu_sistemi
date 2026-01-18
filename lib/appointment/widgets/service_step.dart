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
  double dynamicFontSize = screenWidth * 0.045;
  double iconSize = screenWidth * 0.07;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    decoration: BoxDecoration(
      color: isSelected ? model.color.withOpacity(0.12) : Colors.white.withOpacity(0.02),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          model.color.withOpacity(isSelected ? 0.25 : 0.08),
          Colors.transparent,
        ],
      ),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: isSelected ? model.color : model.color.withOpacity(0.15), width: 2.5),
      boxShadow: [
        if (isSelected)
          BoxShadow(
            color: model.color.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
      ],
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        if (isSelected) {
          context.read<AppointmentBloc>().add(RemoveServiceForAppoinmentList(id: model.id));
        } else {
          context.read<AppointmentBloc>().add(AddServiceForAppointment(service: model));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 15),
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.13,
              height: screenWidth * 0.13,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [model.color.withOpacity(0.4), model.color.withOpacity(0.1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(model.returnTheIconData().icon, color: Colors.white, size: iconSize),
            ),
            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name, style: GoogleFonts.lexend(color: Colors.white, fontSize: dynamicFontSize, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14, color: model.color.withOpacity(0.7)),
                      const SizedBox(width: 4),
                      Text("${model.duration} dk", style: GoogleFonts.lexend(color: Colors.white70, fontSize: dynamicFontSize * 0.75)),
                    ],
                  ),
                ],
              ),
            ),


            Column(
              children: [
                Text("${model.price.toInt()} ₺", style: GoogleFonts.lexend(color: model.color, fontSize: dynamicFontSize * 1.1, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                isSelected ? Icon(Icons.check_circle, color: model.color, size: 22) : Icon(Icons.add_circle_outline, color: Colors.white24, size: 22),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}