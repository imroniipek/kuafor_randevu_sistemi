import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/widgets/hairdresser_step.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/widgets/service_step.dart';
import 'package:kuafor_randevu_takip_uygulamasi/repository/service_repository/service_repository.dart';
import '../../Models/service_model.dart';
import '../../core/consts.dart';
import '../../locator.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List<ServiceModel>? models;
  int currentStep = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final data = await locator<ServiceRepository>().getAllServices();
      setState(() {
        models = data;
        isLoading = false;
      });
    } catch (e) {

      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

      appBar: AppBar(
        title:Text("RANDEVU OLUŞTUR", style: GoogleFonts.lexend(color:Colors.white, fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1.2,)),
        centerTitle: true,
        backgroundColor: Consts.backgroundColor,
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed:()
              {
                Navigator.pop(context);
              }
              , icon: Icon(Icons.arrow_back_ios_new_outlined,size:30),color:Colors.white),
        ),
      ),


      body: SafeArea(
        child: isLoading ? const Center(child: Center(child: CircularProgressIndicator())):
        Column(
          children: [
            Divider(color:Consts.primaryColor,thickness: 1.5,),
            const SizedBox(height: 10,),
            StepIndicator(currentStep: currentStep),
            const SizedBox(height: 15,),
            Expanded(
              child: IndexedStack(
                index: currentStep,
                children: [
                  ServiceStep(services: models ?? []),
                  HairdresserStep(),
                  const Center(child: Text("Personel Seçimi", style: TextStyle(color: Colors.white))),
                  const Center(child: Text("Özet", style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentStep > 0)
            ElevatedButton(
              onPressed: () => setState(() => currentStep--),
              child: const Text("Geri"),
            ),
          ElevatedButton(
            onPressed: () {
              if (currentStep < 3) {
                setState(() => currentStep++);
              }
            },
            child: Text(currentStep == 3 ? "Onayla" : "İleri"),
          ),
        ],
      ),
    );
  }
}
class StepIndicator extends StatelessWidget {
  final int currentStep;
  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index)
      {
        final isActive = index <= currentStep;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 40,
          height:40,
          decoration: BoxDecoration(shape: BoxShape.circle, color: isActive ? Colors.black87 : Consts.primaryColor,),
          child: Center(child: Text("${index + 1}", style: const TextStyle(color: Colors.white,fontSize:25,fontWeight:FontWeight.w400),),
          ),
        );
      }),
    );
  }
}
