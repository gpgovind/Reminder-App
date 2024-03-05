import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../controller/medicine_provider.dart';
import '../../widgets/medicine data/med_dialog_screen.dart';
import '../../widgets/medicine data/med_list.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  void initState() {
    context.read<MedicineController>().box;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MedDialogScreen()));
        },
        backgroundColor: Colors.white,
        child: const Center(
          child: Icon(
            Icons.add_rounded,
            color: Color.fromARGB(255, 32, 119, 35),
          ),
        ),
      ),
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
