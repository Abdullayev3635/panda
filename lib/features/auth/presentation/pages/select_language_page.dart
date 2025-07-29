import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:panda_test/features/common/widgets/common_button.dart';
import 'package:panda_test/features/common/widgets/custom_scale.dart';
import 'package:panda_test/utils/color.dart';
import 'package:panda_test/utils/constants.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  String selectedLanguage = "ru";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(height: kToolbarHeight + MediaQuery.of(context).size.height * 0.1),
            SvgPicture.asset("assets/icons/panda.svg"),
            SizedBox(height: 20),
            Center(child: SvgPicture.asset("assets/icons/panda_txt.svg")),
            Spacer(),
            Text(
              "Выберите язык приложения",
              style: TextStyle(
                color: primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomScaleAnimation(
                    onTap: () {
                      setState(() {
                        selectedLanguage = "uz";
                      });
                    },
                    child: Container(
                      height: 51,
                      decoration: BoxDecoration(
                        color: selectedLanguage == "uz" ? primaryColor : white,
                        border: Border.all(
                          color:
                              selectedLanguage != "uz"
                                  ? primaryColor
                                  : Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "O’zbekcha",
                          style: TextStyle(
                            color: selectedLanguage == "uz" ? white : primaryColor,
                            fontSize: 16,
                            fontWeight:
                                selectedLanguage == "uz"
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomScaleAnimation(
                    onTap: () {
                      setState(() {
                        selectedLanguage = "ru";
                      });
                    },
                    child: Container(
                      height: 51,
                      decoration: BoxDecoration(
                        color: selectedLanguage == "ru" ? primaryColor : white,
                        border: Border.all(
                          color:
                              selectedLanguage != "ru"
                                  ? primaryColor
                                  : Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Русский",
                          style: TextStyle(
                            color: selectedLanguage == "ru" ? white : primaryColor,
                            fontSize: 16,
                            fontWeight:
                                selectedLanguage == "ru"
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    title: "Продолжить",
                    onTap: () {
                      GoRouter.of(context).go(Constants.accessToLocation);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
