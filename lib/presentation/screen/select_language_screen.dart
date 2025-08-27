import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/controllers/language_controller.dart';
import 'package:interview/presentation/screen/home_screen.dart';
import 'package:interview/presentation/utility/app_colors.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';
import 'package:interview/presentation/widgets/custom_sub_header_text.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  final languageController = Get.put(LanguageController());

  final List<Map<String, String>> languages = [
    {"name": "English (US)", "flag": "🇺🇸"},
    {"name": "Indonesia", "flag": "🇮🇩"},
    {"name": "Afghanistan", "flag": "🇦🇫"},
    {"name": "Algeria", "flag": "🇩🇿"},
    {"name": "Malaysia", "flag": "🇲🇾"},
    {"name": "Arabic", "flag": "🇦🇪"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton()),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.026,
            vertical: SizeConfig.screenHeight * 0.020,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.024),
              CustomHeaderText(text: 'What is Your Mother Language'),
              SizedBox(height: SizeConfig.screenHeight * 0.010),
              CustomSubHeaderText(
                text:
                    'Discover what is a podcast description and podcast summary.',
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.020),

              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final isSelected =
                          languageController.selectedIndex.value == index;

                      return /*Row(
                        children: [
                          Text(languages[index]["flag"]!, style: TextStyle(fontSize: 24)),
                          SizedBox(width: 12),
                         Expanded(
                            child: Text(
                              languages[index]["name"]!,
                              style: TextStyle(fontSize: 16),
                            ),
                          ), */ /*
                          ElevatedButton(
                            onPressed: () => languageController.selectLanguage(index),
                            child: Text(isSelected ? "Selected" : "Select"),
                          ),*/ /*
                        ],
                      );*/ ListTile(
                        leading: Text(
                          languages[index]["flag"]!,
                          style: TextStyle(fontSize: 24),
                        ),
                        title: Text(
                          languages[index]["name"]!,
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: SizedBox(
                          width: SizeConfig.screenHeight * 0.16,
                          child: ElevatedButton(
                            onPressed: () {
                              languageController.selectLanguage(index);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  isSelected
                                      ? AppColors.primaryColor
                                      : AppColors.boxColor,
                              foregroundColor:
                                  isSelected ? Colors.white : Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(isSelected ? "Selected" : "Select"),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),

              SizedBox(height: SizeConfig.screenHeight * 0.024),
              ElevatedButton(
                onPressed: () {
                  final lang =
                      languages[languageController.selectedIndex.value]["name"];
                  Get.to(() => HomeScreen(language: lang!));
                },
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
