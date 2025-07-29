import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:panda_test/utils/color.dart';

import '../../../common/widgets/common_textfield.dart';
import '../widgets/choose_region_item.dart';

class ChooseRegionPage extends StatelessWidget {
  ChooseRegionPage({super.key});

  final List<String> regions = [
    "Андижанская область",
    "Бухарская область",
    "Джизахская область",
    "Каракалпакстан",
    "Навойиская область",
    "Самаркадская область",
    "Ташкентская область",
    "Наманганская область",
    "Ферганская область",
    "Хорезмская область",
    "Сурхандарьинская область",
    "Сырдарьинская область",
  ];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          "Местоположение",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextField(
              controller: _searchController,
              prefixIcon: SvgPicture.asset("assets/icons/search.svg"),
              hint: "Поиск",
              autofocus: false,
              hintColor: grey,
              onChanged: (value) {},
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 24),
            Text(
              "Выбрать область",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 4, bottom: 12),
                itemBuilder: (context, index) {
                  return ChooseRegionItem(
                    title: regions[index],
                    onTap: () {},
                    isLast: index == regions.length - 1,
                  );
                },
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: regions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
