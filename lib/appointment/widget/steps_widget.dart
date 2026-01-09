import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuafor_randevu_takip_uygulamasi/Models/extensions/service_extension.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/bloc/appointment_bloc.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/bloc/appointment_event.dart';
import '../../dbbloc/db_bloc.dart';
import '../../dbbloc/db_events.dart';
import '../../dbbloc/db_status.dart';
import '../bloc/appointment_status.dart';

class StepsWidget extends StatefulWidget {

  const StepsWidget({super.key});

  @override
  State<StepsWidget> createState() => _StepsWidgetState();
}

class _StepsWidgetState extends State<StepsWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DbBloc>().add(GetAllOfServicesfromDb());
  }


  int currentStep = 0;
  bool error = false;



  StepState arrangeTheStepState(int i) {
    if (i == currentStep)
    {
      return (error == false) ? StepState.editing : StepState.error;
    }
    else if (i < currentStep)
    {
      return StepState.complete;
    }
    else {
      return StepState.indexed;
    }
  }

  Step serviceStep() {
    return Step(
      title: Text(
        "Servis Seçimi",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
        ),
      ),
      state: arrangeTheStepState(0),
      isActive: currentStep >= 0,
      content: BlocBuilder<DbBloc, DbStatus>(
        builder: (context, dbState) {
          if (dbState.services.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Servis bulunamadı",
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
            );
          }

          return BlocBuilder<AppointmentBloc, AppointmentStatus>(
            builder: (context, appState) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dbState.services.length,
                itemBuilder: (context, index) {
                  final service = dbState.services[index];
                  final isChecked = appState.services.any(
                        (s) => s.id == service.id,
                  );

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(

                      color: isChecked ? Colors.green.withOpacity(0.15) :  Colors.black87,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color:isChecked?Colors.green:Colors.grey.withOpacity(0.3), width: 3,),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      activeColor: Colors.green,
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      value: isChecked,
                      onChanged: (value) {
                        if (value == true) {
                          context.read<AppointmentBloc>().add(
                            AddServiceForAppointment(service: service),
                          );
                          setState(() => error = false);
                        } else {
                          context.read<AppointmentBloc>().add(
                            RemoveServiceForAppoinmentList(id: service.id),
                          );
                        }
                      },
                      title: Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white.withOpacity(0.08),
                            child: service.returnTheIconData(),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(service.name, style: GoogleFonts.poppins(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600,),),
                              const SizedBox(height: 4),
                              Text("${service.duration} dk", style: GoogleFonts.poppins(color: Colors.grey.shade400, fontSize: 20,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }


  Step confirmStep() {
    return Step(
      title: const Text("Onay"),
      state: arrangeTheStepState(1),
      isActive: currentStep >= 1,
      content: const Text("Randevu detaylarını onaylayın."),
    );
  }

  void controlvalues(int i,BuildContext context)
  {
    final appointmentServices=context.watch<AppointmentBloc>().state;
    if(i==0&&appointmentServices.services.isEmpty)
    {
      setState(() {
        error=true;
      });
      return;
    }
    else
    {
      setState(() {
        currentStep++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {


    return Stepper(
      type: StepperType.horizontal,
      currentStep: currentStep,
      onStepContinue:()=>controlvalues(0,context),
      onStepCancel: () {
        if (currentStep > 0)
        {
          setState(() {
            currentStep--;
            error = false;
          });
        }
      },
      steps: [
        serviceStep(),
        confirmStep(),
      ],
    );
  }
}