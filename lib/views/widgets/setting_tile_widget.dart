import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTileWidget extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  final String data;
 final Color? color;
  const SettingsTileWidget({
    super.key,
    required this.data,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 15.sp),
      child: ListTile(
        leading: Icon(icon,color:color ,),
        onTap: onTap,
        title: Row(
          children: [
            SizedBox(
              width: 50.w,
            ),
            Text(
              data,
              style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_outlined,
          color: Color.fromRGBO(33, 150, 243, 1),
        ),
      ),
    );
  }
}
