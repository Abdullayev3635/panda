import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:panda_test/features/common/widgets/custom_scale.dart';
import 'package:panda_test/utils/color.dart';

class ChooseRegionItem extends StatelessWidget {
  const ChooseRegionItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isLast,
  });

  final String title;
  final VoidCallback onTap;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomScaleAnimation(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                Spacer(),
                SvgPicture.asset("assets/icons/chevron-right.svg"),
              ],
            ),
          ),
        ),
        if (!isLast) Divider(height: 1, color: solitude),
      ],
    );
  }
}
