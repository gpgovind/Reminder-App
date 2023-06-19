import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder/provider/medicine_provider.dart';
import '../../widgets/medicine data/med_list.dart';
import '../../widgets/medicine data/medform_validation.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  void initState() {
    context.read<MedicineProvider>().box;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      floatingActionButton: const MedFormShowDialog(),
      body: Column(
        children: [
          ListTile(
            leading: Text('Your Records',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
          ),
          const Expanded(child: MedList())
        ],
      ),
    );
  }
}
