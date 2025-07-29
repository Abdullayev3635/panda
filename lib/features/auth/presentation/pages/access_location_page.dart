import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:panda_test/features/common/widgets/common_button.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../utils/color.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/error_toast.dart';
import '../../../common/widgets/custom_scale.dart';

class AccessLocationPage extends StatelessWidget {
  const AccessLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.asset("assets/icons/location_marker.png")),
            Text(
              "Разрешите доступ к геопозиции",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Так мы сможем показать интересные предложения и пункты выдачи-приёма рядом с вами",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 32),
            CommonButton(
              title: "Разрешить доступ",
              onTap: () async {
                final status = await Permission.location.status;
                if (status.isGranted) {
                  showSuccessToast(context, message: "Permission is already granted");
                } else {
                  Permission.location.request().then((value) {
                    if (value.isGranted) {
                      showSuccessToast(context, message: "Permission is granted");
                    } else {
                      showErrorToast(context, message: "Permission is denied");
                    }
                  });
                }
              },
            ),
            SizedBox(height: 16),
            CustomScaleAnimation(
              onTap: () {
                GoRouter.of(context).push(Constants.chooseRegion);
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "Указать местоположение",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
