import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/styling/size_config.dart';
import 'package:interview/presentation/controllers/location_controller.dart';
import 'package:interview/presentation/screen/auth_screens/signin_screen.dart';
import 'package:interview/presentation/widgets/custom_header_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.language});
  final String language;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.026,
            vertical: SizeConfig.screenHeight * 0.020,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return CustomHeaderText(
                    text:
                        'Your Location is: ${_locationController.latitude.value}, ${_locationController.longitude.value}\nYour Mother Language is: ${widget.language}',
                  );
                }),

                SizedBox(height: SizeConfig.screenHeight * 0.080),

                ElevatedButton(
                  onPressed: () async {
                    await Supabase.instance.client.auth.signOut();
                    if (mounted) {
                      Get.offAll(() => SigninScreen());
                    }
                  },
                  child: Text('Log Out'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
