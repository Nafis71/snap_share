import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:snap_share/features/authentication/common/view_model/auth_vm.dart';

import '../utilities/login_strings.dart';

class SavePasswordCheckbox extends StatelessWidget {
  final AuthVM authVM;

  const SavePasswordCheckbox({super.key, required this.authVM});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RSizedBox(
          width: 15.w,
          child: Obx(()=> Checkbox(
            value: authVM.savePassword.value,
            onChanged: (value) {
              authVM.savePassword.toggle();
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),),
        ),
        const Gap(5),
        Text(
          LoginStrings.kSavePasswordCheckBoxTxt,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 10.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
